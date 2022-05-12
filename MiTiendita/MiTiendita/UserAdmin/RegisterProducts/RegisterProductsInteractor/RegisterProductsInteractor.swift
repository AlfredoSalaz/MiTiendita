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
        RequestManager.generic(url: ExternalData().urlAddProduct, metodo: "POST", contenido: data, delegate: self, tag: 0)
    }
    func editProduct(data: [String : Any], id: Int) {
        RequestManager.generic(url: "\(ExternalData().editProduct)\(id)", metodo: "PUT",contenido: data, tipoDato: Product.self, delegate: self, tag: 1)
    }
    
}
extension RegisterProductsInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        print("Se guardo")
        switch tag {
        case 0:
            output?.savedProductInAPI()
        case 1:
            if let data = data as? Product?{
                print("data \(data?.description)")
                
                output?.savedProductInAPI()
            }
        default:
            break
        }
        
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("No se guardo")
    }
}
