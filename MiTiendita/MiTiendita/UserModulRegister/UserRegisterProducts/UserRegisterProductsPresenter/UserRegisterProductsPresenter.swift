//
//  UserRegisterProductsPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit


class UserRegisterProductsPresenter: NSObject, UserRegisterProductsPresenterProtocol{

    
    var view: UserRegisterProductsViewControllerProtocol?
    
    var interactor: UserRegisterProductsInteractorProtocol?
    
    var router: UserRegisterProductsRouterProtocol?
    
    func getListProduct() {
        interactor?.getListProduct()
    }
    
}

extension UserRegisterProductsPresenter: UserRegisterProductsOutputProtocol{
    func onRecivedproducts(data: [Product]) {
        view?.receivedlistProduct(data: data)
    }
    
    func onRecivedFaillureData() {
        view?.faillureData()
    }
    
    
}
