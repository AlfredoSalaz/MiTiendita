//
//  MainAdminInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit

class MainAdminInteractor: NSObject, MainAdminInteractorProtocol {
    var output: MainAdminInteractorOutputProtocol?
    
    func getCategoriesProduct(){
        RequestManager.generic(url: ExternalData().categoriesProduct, metodo: "GET", tipoResultado: [CategoryProduct].self, delegate: self, tag: 0)
    }
    func getProducts(){
        print("Antes del request")
        RequestManager.generic(url: ExternalData().listProduct, metodo: "GET", tipoResultado: [Product].self, delegate: self, tag: 1)
    }
    
}
extension MainAdminInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        switch tag {
        case 0:
            if let dato = data as? [CategoryProduct] {
                output?.onRecivedCategory(data: dato)
            }
        case 1:
            if let dato = data as? [Product] {
                output?.onRecivedproducts(data: dato)
            }
        default:
            output?.onRecivedFaillureData()
        }
        
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Faillure..")
    }
}
