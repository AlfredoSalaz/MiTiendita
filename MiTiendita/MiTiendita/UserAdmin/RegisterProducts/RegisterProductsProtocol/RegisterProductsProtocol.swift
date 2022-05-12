//
//  RegisterProductsProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import UIKit

protocol RegisterProductsViewControllerProtocol: UIViewController {
    var presenter: RegisterProductsPresenterProtocol? {get set}
    func savedProductsInAPI()
    var isEditt: Bool?{get set}
}

protocol RegisterProductsPresenterProtocol: NSObject {
    var view: RegisterProductsViewControllerProtocol? {get set}
    var interactor: RegisterProductsInteractorProtocol? {get set}
    var router: RegisterProductsRouterProtocol? {get set}
    var isEditt: Bool?{get set}
    func saveNewProduct(data: [String: Any])
    func edithProduct(data: [String: Any])
    func loadInfo()
}

protocol RegisterProductsInteractorProtocol: NSObject {
    var output: RegisterProductsInteractorOutputProtocol? {get set}
    func saveNewProducts(data: [String: Any])
    func editProduct(data: [String: Any])
}

protocol RegisterProductsInteractorOutputProtocol{
    func savedProductInAPI()
}

protocol RegisterProductsRouterProtocol {
    var presenter: RegisterProductsPresenterProtocol? {get set}
    static func createModuleRegisterProduct(isEdit: Bool?) -> UIViewController
}
