//
//  RegisterCategoryProtocols.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

protocol RegisterCategoryViewControllerProtocol: UIViewController {
    var presenter: RegisterCategoryPresenterProtocol? {get set}
    func recivedUrl(url: String)
    func savedCategory(data: CategoryProduct)
    var category: CategoryProduct?{get set}
    var isEdit: Bool?{get set}
}

protocol RegisterCategoryPresenterProtocol: NSObject {
    var view: RegisterCategoryViewControllerProtocol? {get set}
    var interactor: RegisterCategoryInteractorProtocol? {get set}
    var router: RegisterCategoryRouterProtocol? {get set}
    var categoryPre: CategoryProduct? {get set}
    var isEditPre: Bool?{get set}
    
    func saveCategory(data: [String: Any] )
    func saveImage(type: String, nameFile: String, image: UIImage)
    func edittCategory(data: [String: Any], id: Int)
    func saveInCoreData(data: CategoryRegister)
    func recivedCategoryEdit()
}

protocol RegisterCategoryInteractorProtocol: NSObject {
    var output: RegisterCategoryInteractorOutputProtocol? {get set}
    func savedCategory(data: [String: Any] )
    func editeddCategory(data: [String: Any], id: Int)
    func savedImage(type: String, nameFile: String, image: UIImage)
    func savedInCoreData(data: CategoryRegister)
}

protocol RegisterCategoryInteractorOutputProtocol {
    func onRecivedUrlImage(url: String)
    func onRecivedMesageSuccesfulCategory(data: CategoryProduct)
    func onRecivedMessageFaillure()
}

protocol RegisterCategoryRouterProtocol {
    var presenter: RegisterCategoryPresenterProtocol? {get set}
    static func createModuleRegisterCategory(data: CategoryProduct?, isEdit: Bool?) -> UIViewController
}
