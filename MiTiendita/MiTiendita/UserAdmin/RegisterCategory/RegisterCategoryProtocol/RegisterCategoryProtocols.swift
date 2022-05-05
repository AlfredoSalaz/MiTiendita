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
    func savedCategory()
}

protocol RegisterCategoryPresenterProtocol: NSObject {
    var view: RegisterCategoryViewControllerProtocol? {get set}
    var interactor: RegisterCategoryInteractorProtocol? {get set}
    var router: RegisterCategoryRouterProtocol? {get set}
    
    func saveCategory(data: [String: Any] )
    func saveImage(type: String, nameFile: String, image: UIImage)
    func saveInCoreData(data: CategoryRegister)
}

protocol RegisterCategoryInteractorProtocol: NSObject {
    var output: RegisterCategoryInteractorOutputProtocol? {get set}
    func savedCategory(data: [String: Any] )
    func savedImage(type: String, nameFile: String, image: UIImage)
    func savedInCoreData(data: CategoryRegister)
}

protocol RegisterCategoryInteractorOutputProtocol {
    func onRecivedUrlImage(url: String)
    func onRecivedMesageSuccesfulCategory()
    func onRecivedMessageFaillure()
}

protocol RegisterCategoryRouterProtocol {
    var presenter: RegisterCategoryPresenterProtocol? {get set}
    static func createModuleRegisterCategory() -> UIViewController
}
