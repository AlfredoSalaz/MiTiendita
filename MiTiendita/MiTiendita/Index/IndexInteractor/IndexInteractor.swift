//
//  IndexInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexInteractor: NSObject, IndexInteractorProtocol{
    var output: IndexInteractorOutputProtocol?
    
    func getAllUsers() {
        RequestManager.generic(url: ExternalData().urlGetUser, metodo: "GET", tipoDato: [User].self, delegate: self)
    }
}

extension IndexInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        if let data = data as? [User] {
            output?.onRecivedUser(data: data)
        }
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Faillure")
    }
}
