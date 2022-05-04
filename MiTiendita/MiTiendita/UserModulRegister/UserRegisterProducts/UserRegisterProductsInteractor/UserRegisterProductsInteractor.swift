//
//  UserRegisterProductsInteractor.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit

class UserRegisterProductsInteractor: NSObject, UserRegisterProductsInteractorProtocol, RequestManagerDelegate{

    var output: UserRegisterProductsOutputProtocol?
    
    func getListProduct() {
        RequestManager.generic(url: ExternalData().listProduct, metodo: "GET", tipoResultado: [Product].self, delegate: self, tag: 1)
        //RequestManager.generic(url: ExternalData().listProduct, metodo: "GET",  tipoResultado: [Product].self, delegate: self)
    }
    
    func onResponseSuccess(data: Decodable?, tag: Int) {
        
        if let dato = data as? [Product] {
            output?.onRecivedproducts(data: dato)
        }
    }
    
    func onResponseFailure(error: CodeResponse, tag: Int) {
        output?.onRecivedFaillureData()
    }
         

}
