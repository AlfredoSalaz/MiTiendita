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
    var isEditt: Bool?
    func saveNewProduct(data: [String: Any]){
        interactor?.saveNewProducts(data: data)
    }
    func loadInfo() {
        view?.isEditt = isEditt
    }
    func edithProduct(data: [String : Any]) {
        interactor?.editProduct(data: data)
    }
}

extension RegisterProductsPresenter: RegisterProductsInteractorOutputProtocol {
    
    func savedProductInAPI() {
        view?.savedProductsInAPI()
    }
}
