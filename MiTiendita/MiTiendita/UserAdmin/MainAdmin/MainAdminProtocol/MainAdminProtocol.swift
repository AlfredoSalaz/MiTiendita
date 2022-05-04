//
//  MainAdminProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit
//VIEW
protocol MainAdminViewControllerProtocol: UIViewController{
    var presenter: MainAdminPresenterProtocol? {get set}
    func onReceivedCategoryProduct(data: [CategoryProduct])
    func onReceivedlistProduct(data: [Product])
    func faillureData()
    var user: User? {get set}
}
//pRESNTER
protocol MainAdminPresenterProtocol: NSObject{
    var view: MainAdminViewControllerProtocol? {get set}
    var interactor: MainAdminInteractorProtocol? {get set}
    var router: MainAdminRouterProtocol? {get set}
    func openEditUser(user: User, isEdditing: Bool)
    func openRegisterCategory()
    func openListProduct()
    func getCategories()
    func getProduct()
    
}
//INTERACTOR
protocol MainAdminInteractorProtocol: NSObject {
    var output: MainAdminInteractorOutputProtocol? {get set}
    func getCategoriesProduct()
    func getProducts()
}
//OUTPUT INTERACTOR - PRESENTER
protocol MainAdminInteractorOutputProtocol: NSObject {
    func onRecivedCategory(data: [CategoryProduct])
    func onRecibiProducto(data: [Product])
    func onRecivedFaillureData()
}
//ROUTER
protocol MainAdminRouterProtocol {
    var presenter: MainAdminPresenterProtocol? {get set}
    static func createModuleMainAdmin(user: User) -> UIViewController
}
