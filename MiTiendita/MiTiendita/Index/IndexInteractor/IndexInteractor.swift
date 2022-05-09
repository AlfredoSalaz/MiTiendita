//
//  IndexInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexInteractor: NSObject, IndexInteractorProtocol{
    var output: IndexInteractorOutputProtocol?
    
    /*func getAllUsers() {
        RequestManager.generic(url: ExternalData().urlGetUser, metodo: "GET", tipoDato: [User].self, delegate: self)
    }*/
    
    func authenticatioUser(data: [String : Any]) {
        RequestManager.generic(url: ExternalData().urlGetToken, metodo: "POST", contenido: data, tipoDato: UserToken.self, delegate: self, tag: 0)
    }
    
    func getUserAuthenticatio(token: String) {
        ExternalDataUser().getUserWithToken(token: token, url: ExternalData().urlGetPerfile, delegate: self)
    }
}

extension IndexInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        switch tag {
        case 0:
            if let data = data as? UserToken{
                output?.onRecivedToken(data: data)
            }
        default:
            break
        }
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Faillure")
    }
}

extension IndexInteractor: ExternalDataUserDelegate{
    func onRecivedDataUser(data: User) {
        print("dataU: \(data.name)")
        output?.onRecivedUser(data: data)
    }
    func onResponseFaillure(error: NSError) {
        print("fallo auiiis")
    }
}
