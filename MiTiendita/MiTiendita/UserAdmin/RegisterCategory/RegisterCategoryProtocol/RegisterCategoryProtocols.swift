//
//  RegisterCategoryProtocols.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

protocol RegisterCategoryViewControllerProtocol: UIViewController {
    var presenter: RegisterCategoryPresenterProtocol? {get set}
}

protocol RegisterCategoryPresenterProtocol: NSObject {
    var view: RegisterCategoryViewControllerProtocol? {get set}
    var interactor: RegisterCategoryInteractorProtocol? {get set}
    var router: RegisterCategoryRouterProtocol? {get set}
    
    func saveCategory()
}

protocol RegisterCategoryInteractorProtocol: NSObject {
    var output: RegisterCategoryInteractorOutputProtocol? {get set}
    func savedCategory()
}

protocol RegisterCategoryInteractorOutputProtocol {
    
}

protocol RegisterCategoryRouterProtocol {
    var presenter: RegisterCategoryPresenterProtocol? {get set}
    static func createModuleRegisterCategory() -> UIViewController
}
