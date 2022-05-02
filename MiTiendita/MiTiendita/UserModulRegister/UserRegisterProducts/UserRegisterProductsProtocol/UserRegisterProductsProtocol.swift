//
//  UserRegisterProductsProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit

//View
protocol UserRegisterProductsViewControllerProtocol: UIViewController {
    var presenter: UserRegisterProductsPresenterProtocol? {get set}
    func receivedlistProduct(data: [Product])
    func faillureData()
}

//Presenter
protocol UserRegisterProductsPresenterProtocol: NSObject {
    var view: UserRegisterProductsViewControllerProtocol? {get set}
    var interactor: UserRegisterProductsInteractorProtocol? {get set}
    var router: UserRegisterProductsRouterProtocol? {get set}
    func getListProduct()
    
}

//Interactor
protocol UserRegisterProductsInteractorProtocol: NSObject {
    var output: UserRegisterProductsOutputProtocol? {get set}
    func getListProduct()
}

protocol UserRegisterProductsOutputProtocol: NSObject {
    
    func onRecivedproducts(data: [Product])
    func onRecivedFaillureData()
    
}

//Router
protocol UserRegisterProductsRouterProtocol {
    var presenter: UserRegisterProductsPresenterProtocol? {get set}
    static func createModuleUserRegisterProducts() -> UIViewController
}
