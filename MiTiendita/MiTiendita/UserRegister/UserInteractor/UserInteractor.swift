//
//  UserInteractor.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

class UserInteractor: NSObject, UserInteractorProtocol{

    var output: UserInteractorOutputProtocol?
    
    func saveUserApi(user: [String : Any]) {
        
        var email: Any?
        
        for (key,value) in user{
            if key == "email"{
                let a = value
                email = a
                
            }
        }
        print(email)
        let data1: [String: Any] = [
            "email": email!
        ]
    
        RequestManager.generic(url: ExternalData().checkUrlAvailable, metodo: "POST", contenido: data1, tipoDato: ValidateEmail.self, delegate: self, tag: 0)
        //RequestManager.generic(url: ExternalData().urlAddNewUser, metodo: "POST", contenido: user, tipoDato: User.self, delegate: self)
    }
    
}

extension UserInteractor: RequestManagerDelegate{
        func onResponseSuccess(data: Decodable?, tag: Int) {
            switch tag{
            case 0:
                if let data = data as? ValidateEmail{
                    print("datos: \(data.isAvailable)")
                }

            default:
                break
            }
        }
        func onResponseFailure(error: CodeResponse, tag: Int) {
            print("No se guardo")
        }
    }
