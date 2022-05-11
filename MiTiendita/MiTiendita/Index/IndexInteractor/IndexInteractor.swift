//
//  IndexInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexInteractor: NSObject, IndexInteractorProtocol{
    var output: IndexInteractorOutputProtocol?
    ///Funcion que hace la consulta del token del usuario a la API
    /// - Parameter data: Diccionario que contiene el correo y la pass para consultar en la API si existe
    func authenticatioUser(data: [String : Any]) {
        RequestManager.generic(url: ExternalData().urlGetToken, metodo: "POST", contenido: data, tipoDato: UserToken.self, delegate: self, tag: 0)
    }
    ///Funcion que hace la consulta del perfil del usuario a la API
    /// - Parameter token: Se envia el token del usuario para obtener la informacion del perfil
    func getUserAuthenticatio(token: String) {
        ExternalDataUser().getUserWithToken(token: token, url: ExternalData().urlGetPerfile, delegate: self)
    }
}
//MARK: Delegado del RequestManager
extension IndexInteractor: RequestManagerDelegate{
    ///Funcion que se ejecuta cuando la informacion consultada se devuelve con exito
    /// - Parameter data: Contiene el tipo de dato que se quiere recibir
    /// - Parameter tag: Identificador de la peticion
    func onResponseSuccess(data: Decodable?, tag: Int) {
        switch tag {
        case 0:
            if let data = data as? UserToken{
                if data.access_token != "" && data.access_token != nil{
                    output?.onRecivedToken(data: data)
                }else{
                    output?.faillureAuthPre()
                }
            }
        default:
            break
        }
    }
    ///Funcion que se ejecuta cuando la informacion consultada presenta un error o no se pudo obtener la informacion
    /// - Parameter error: Contiene el error de la peticion
    /// - Parameter tag: Identificador de la peticion
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Faillure")
    }
}
//MARK: Se extiende los delagados de ExternalData
extension IndexInteractor: ExternalDataUserDelegate{
    /// Funcion que se ejecuta cuando la peticion del User es satisfactorio
    /// - Parameter data: Objeto de tipo User que devuelve la API
    func onRecivedDataUser(data: User) {        output?.onRecivedUser(data: data)
    }
    /// Funcion que se ejecuta cuando la peticion del User fue fallido
    /// - Parameter error: error que se obtuvo en la consuta
    func onResponseFaillure(error: NSError) {
        output?.faillureAuthPre()
    }
}
