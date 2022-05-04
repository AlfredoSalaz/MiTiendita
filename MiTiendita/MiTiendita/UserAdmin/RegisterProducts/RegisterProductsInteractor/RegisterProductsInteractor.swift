//
//  RegisterProductsInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import UIKit

class RegisterProductsInteractor: NSObject, RegisterProductsInteractorProtocol{
    var output: RegisterProductsInteractorOutputProtocol?
    
    func saveNewProducts(data: [String: Any]) {
        print("data: \(data)")
        RequestManager.generic(url: ExternalData().urlAddProduct, metodo: "POST", contenido: data, delegate: self)
    }
    
}
extension RegisterProductsInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        print("Se guardo")
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("No se guardo")
    }
}
