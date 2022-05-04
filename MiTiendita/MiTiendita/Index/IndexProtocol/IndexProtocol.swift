//
//  IndexProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

protocol IndexViewControllerProtocol: UIViewController{
    var presenter: IndexPresenterProtocol? {get set}
    func recivedAllUser(data: [User])
}

protocol IndexPresenterProtocol: NSObject{
    var view: IndexViewControllerProtocol? {get set}
    var interactor: IndexInteractorProtocol? {get set}
    var router: IndexRouterProtocol? {get set}
    func openMainTienda(user: User)
    func openViewRegister()
    func getAllUser()
}

protocol IndexInteractorProtocol: NSObject {
    var output: IndexInteractorOutputProtocol? {get set}
    func getAllUsers()
}

protocol IndexInteractorOutputProtocol {
    func onRecivedUser(data: [User])
}

protocol IndexRouterProtocol {
    var presenter: IndexPresenterProtocol? {get set}
    static func createModule() -> UIViewController
}
