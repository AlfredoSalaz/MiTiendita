//
//  UserRegisterProductsProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit

protocol UserRegisterProductsViewControllerProtocol: UIViewController {
    var presenter: UserRegisterProductsPresenterProtocol? {get set}
}

protocol UserRegisterProductsPresenterProtocol: NSObject {
    var view: UserRegisterProductsViewControllerProtocol? {get set}
    var interactor: UserRegisterProductsInteractorProtocol? {get set}
    var router: UserRegisterProductsRouterProtocol? {get set}
}
protocol UserRegisterProductsInteractorProtocol: NSObject {
    var output: UserRegisterProductsOutputProtocol? {get set}
}

protocol UserRegisterProductsOutputProtocol: NSObject {
    
}

protocol UserRegisterProductsRouterProtocol {
    var presenter: UserRegisterProductsPresenterProtocol? {get set}
    static func createModuleUserRegisterProducts() -> UIViewController
}
