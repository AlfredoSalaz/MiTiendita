//
//  UserInteractor.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

class UserInteractor: NSObject, UserInteractorProtocol{
    
    var output: UserInteractorOutputProtocol?
    
    ///Función que valida que el correo electronico ingresado no exista en la API
    /// - Parameter user: Diccionario que contiene la informacion del usuario
    func saveUserApi(user: [String : Any]) {
        var email: Any?
        for (key,value) in user{
            if key == "email"{
                let a = value
                email = a
            }
        }
        let data1: [String: Any] = [
            "email": email!
        ]
        RequestManager.generic(url: ExternalData().checkUrlAvailable, metodo: "POST", contenido: data1, tipoDato: ValidateEmail.self, delegate: self, tag: 0)
    }
    
    ///Función que guarda el usuario en la API
    /// - Parameter user: Diccionario que contiene la informacion del usuario ya verificada en la API
    func trySavedUserApi(user: [String : Any]) {
        RequestManager.generic(url: ExternalData().urlAddNewUser, metodo: "POST", contenido: user, tipoDato: User.self, delegate: self, tag: 1)
    }
}

//MARK: se extiende la clase principal agregando los delegados de ExternalData
extension UserInteractor: RequestManagerDelegate{
        ///Función que se ejecuta seg
        func onResponseSuccess(data: Decodable?, tag: Int) {
            ///Switch que ejecuta la respuesta de cada solicitud en dos case 0 y 1
            switch tag{
            case 0:
                if let data = data as? ValidateEmail{
                    output?.errorCheckEmail(user: data)
                    print("En proceso de verificacion ")
                }
            case 1:
                print("Ocultando la vista")
                output?.dismissWindow()
                
            default:
                break
            }
        }
        func onResponseFailure(error: CodeResponse, tag: Int) {
            print("No se guardo")
        }
    }
