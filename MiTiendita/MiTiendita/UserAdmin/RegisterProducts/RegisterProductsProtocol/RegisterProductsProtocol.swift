//
//  RegisterProductsProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import UIKit

protocol RegisterProductsViewControllerProtocol: UIViewController {
    var presenter: RegisterProductsPresenterProtocol? {get set}
    
}

protocol RegisterProductsPresenterProtocol: NSObject {
    var view: RegisterProductsViewControllerProtocol? {get set}
    var interactor: RegisterProductsInteractorProtocol? {get set}
    var router: RegisterProductsRouterProtocol? {get set}
    func saveNewProduct(data: [String: Any])
}

protocol RegisterProductsInteractorProtocol: NSObject {
    var output: RegisterProductsInteractorOutputProtocol? {get set}
    func saveNewProducts(data: [String: Any])
}

protocol RegisterProductsInteractorOutputProtocol{
    
}

protocol RegisterProductsRouterProtocol {
    var presenter: RegisterProductsPresenterProtocol? {get set}
    static func createModuleRegisterProduct() -> UIViewController
}
