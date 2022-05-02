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
}

protocol RegisterProductsInteractorProtocol: NSObject {
    var output: RegisterProductsInteractorOutputProtocol? {get set}
}

protocol RegisterProductsInteractorOutputProtocol{
    
}

protocol RegisterProductsRouterProtocol {
    var presenter: RegisterProductsPresenterProtocol? {get set}
    static func createModuleRegisterProduct() -> UIViewController
}
