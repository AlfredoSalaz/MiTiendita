//
//  IndexProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

protocol IndexViewControllerProtocol: UIViewController{
    var presenter: IndexPresenterProtocol? {get set}
}

protocol IndexPresenterProtocol: NSObject{
    var view: IndexViewControllerProtocol? {get set}
    var interactor: IndexInteractorProtocol? {get set}
    var router: IndexRouterProtocol? {get set}
    func openMainTienda(tipeUser: String)
    func openViewRegister()
}

protocol IndexInteractorProtocol: NSObject {
    var output: IndexInteractorOutputProtocol? {get set}
}

protocol IndexInteractorOutputProtocol {
    
}

protocol IndexRouterProtocol {
    var presenter: IndexPresenterProtocol? {get set}
    static func createModule() -> UIViewController
}
