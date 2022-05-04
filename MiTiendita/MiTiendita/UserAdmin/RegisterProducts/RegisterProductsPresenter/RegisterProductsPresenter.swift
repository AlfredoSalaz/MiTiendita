//
//  RegisterProductsPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import UIKit

class RegisterProductsPresenter: NSObject, RegisterProductsPresenterProtocol {
    weak var view: RegisterProductsViewControllerProtocol?
    var interactor: RegisterProductsInteractorProtocol?
    var router: RegisterProductsRouterProtocol?
    
    func saveNewProduct(data: [String: Any]){
        interactor?.saveNewProducts(data: data)
    }
}

extension RegisterProductsPresenter: RegisterProductsInteractorOutputProtocol {
    
}
