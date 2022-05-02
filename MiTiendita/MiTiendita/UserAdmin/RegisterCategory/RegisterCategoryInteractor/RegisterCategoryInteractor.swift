//
//  RegisterCategoryInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

class RegisterCategoryInteractor: NSObject, RegisterCategoryInteractorProtocol {
    var output: RegisterCategoryInteractorOutputProtocol?
    
    var test: [String: Any] = [
        "name": "Lacteos",
        "image": "https://api.escuelajs.co/api/v1/files/14ba.jpeg"
    ]
    
    func savedCategory() {
        RequestManager.generic(url: ExternalData().urlAddCategory, metodo: "POST", contenido: test, delegate: self, tag: 0)
    }
    
}
extension RegisterCategoryInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        print("Success")
        
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Faullure")
    }
}
