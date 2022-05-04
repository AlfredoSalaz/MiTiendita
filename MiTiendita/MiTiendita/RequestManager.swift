//
//  RequestManager.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit

class RequestManager {
    
    static func generic< T: Decodable> (url: String, metodo: String?,contenido:[String: Any]? = nil, tipoDato: T.Type?, delegate: RequestManagerDelegate, tag: Int = 0 ){
        
        guard let url = URL(string: url) else {
            delegate.onResponseFailure(data: nil ,error: .BAD_REQUEST, tag: tag)
            return
        }
        print("---url---")
        if metodo == "GET"{
            let urlSession = URLSession.shared.dataTask(with: url){
                data, response, error in
                guard let data = data else {return}
                do{
                    let obj = tipoDato == nil ? nil : try JSONDecoder().decode(tipoDato!.self, from: data)
                    if tipoDato != nil && obj == nil && !data.isEmpty {
                        print( "Posible bad decodable \((String(data: data, encoding: .utf8)) ?? "not_string")")
                        delegate.onResponseFailure(data: nil, error: .BAD_DECODABLE, tag: tag)
                    } else {
                        delegate.onResponseSuccess(data: obj, tag: tag)
                    }
                }catch {
                    delegate.onResponseFailure(data: nil, error: .BAD_DECODABLE, tag: tag)
                    print(error)
                }
            }
            urlSession.resume()
        }
        if metodo == "POST"{
            print("----Post")
            var peticion = URLRequest(url: url)
            peticion.httpMethod = "POST"
            peticion.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print("COntenido \(contenido)")
            let datos: [String: Any] = contenido!
            peticion.httpBody = try? JSONSerialization.data(withJSONObject: datos, options: .fragmentsAllowed)
            let tarea = URLSession.shared.dataTask(with: peticion){
                data, response, error in
                guard let datos = data, error == nil else {return}
                print("Data extoo")
                do{
                    let obj = tipoDato == nil ? nil : try JSONDecoder().decode(tipoDato!.self, from: datos)
                    if tipoDato != nil && obj == nil && !datos.isEmpty {
                        print( "Posible bad decodable \((String(data: datos, encoding: .utf8)) ?? "not_string")")
                        delegate.onResponseFailure(data: nil, error: .BAD_DECODABLE, tag: tag)
                    } else {
                        delegate.onResponseSuccess(data: obj, tag: tag)
                    }
                }catch{
                    delegate.onResponseFailure(data: nil, error: .BAD_DECODABLE, tag: tag)
                    print(error)
                }
            }
            tarea.resume()
        }
    }
    
    static func generic(url:String, metodo:String,  delegate:RequestManagerDelegate, tag:Int = 0) {
        let c : [String: Any]? = nil
        let t : DummyCodable.Type? = nil
        self.generic(url: url, metodo: metodo, contenido: c, tipoDato: t, delegate: delegate, tag: tag)
    }
    static func generic(url:String, metodo:String, contenido: [String: Any]? = nil, delegate:RequestManagerDelegate, tag:Int = 0){
        let t : DummyCodable.Type? = nil
        self.generic(url: url, metodo: metodo, contenido: contenido, tipoDato: t, delegate: delegate, tag: tag)
    }
    static func generic<T:Decodable>(url:String, metodo:String, tipoResultado:T.Type?, delegate:RequestManagerDelegate, tag:Int = 0) {
        let c : [String: Any]? = nil
        self.generic(url: url, metodo: metodo, contenido: c,tipoDato: tipoResultado, delegate: delegate, tag: tag)
    }
    
}
class DummyCodable:Codable {}
protocol RequestManagerDelegate {
    func onResponseSuccess(data:Decodable?,tag:Int)
    func onResponseFailure(error:CodeResponse,tag:Int)
}
extension RequestManagerDelegate {
    func onResponseSuccess(data:Decodable?,tag:Int) {
    }
    func onResponseFailure(error:CodeResponse,tag:Int) {
    }
    
    func onResponseFailure(data: ErrorEntity?, error: CodeResponse, tag: Int){
        onResponseFailure(error: error, tag: tag)
    }
}

enum CodeResponse: Int {
    
    case BAD_REQUEST = 400
    case SERVER_ERROR = 500
    case NOT_FOUND = 404
    
    case OK200 = 200 // OK
    case SIN_CONTENIDO = 204
    
    case UNKNOW = -1
    case NOT_CONNECTION = -2
    case BAD_DECODABLE = -4
    
}
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
class ErrorEntity: Codable {
    var code: Int?
    var type: String?
    var message: String?
}
 
extension RequestManager {
    func subirImagen(nombreParametro: String, nombreArchivo: String, imagen: UIImage, delegate: RequestManagerDelegate, tag: Int = 0) {
            //Genera y válida URL
            guard let url = URL(string: "https://api.escuelajs.co/api/v1/files/upload") else {return}
            //Para entidades de tipo multipart la directiva boundary es obligatoria. Ella consiste en una secuencia de 1 a 70 caracteres de un conjunto conocido por su robustez en pasarelas de correo electrónico, y no pueden terminar con espacios en blanco. Es usada para encapsular los limites de los mensajes de múltiples partes.
            let boundary = UUID().uuidString
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            var data = Data()
            data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"\(nombreParametro)\"; filename=\"\(nombreArchivo)\"\r\n".data(using: .utf8)!)
            data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
            data.append(imagen.pngData()!)
            data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
            print(String(decoding: data, as: UTF8.self))
            URLSession.shared.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                    print("statusCode debería ser 200 y es \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                if error == nil {
                    let jsonData = try? JSONDecoder().decode(RespuestaSubirImagen.self, from: responseData!)
                    print(jsonData!)
                    delegate.onResponseSuccess(data: jsonData, tag: tag)
                    //let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                    /*if let json = jsonData as? [String: Any] {
                        print(json)
                    }*/
                }else{
                    delegate.onResponseFailure(error: .BAD_DECODABLE, tag: tag)
                }
            }).resume()
        }
}

struct RespuestaSubirImagen: Codable{
    var originalname: String
    var filename: String
    var location: String
    
}
