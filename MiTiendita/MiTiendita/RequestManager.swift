//
//  RequestManager.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import Foundation

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
