//
//  IndexProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

protocol IndexViewControllerProtocol: UIViewController{
    var presenter: IndexPresenterProtocol? {get set}
    func recivedUser(data: User)
    func recivedToken(token: UserToken)
    func faillureAuthView()
}

protocol IndexPresenterProtocol: NSObject{
    var view: IndexViewControllerProtocol? {get set}
    var interactor: IndexInteractorProtocol? {get set}
    var router: IndexRouterProtocol? {get set}
    func openMainTienda(user: User)
    func openViewRegister()
    func authenticationUser(data: [String: Any])
    func getUserAuthentication(token: String)
}

protocol IndexInteractorProtocol: NSObject {
    var output: IndexInteractorOutputProtocol? {get set}
    func authenticatioUser(data: [String: Any])
    func getUserAuthenticatio(token: String)
}

protocol IndexInteractorOutputProtocol {
    func onRecivedToken(data: UserToken)
    func onRecivedUser(data: User)
    func onResponseFaillure(error: NSError)
    func faillureAuthPre()
}

protocol IndexRouterProtocol {
    func openViewRegisters(view: IndexViewControllerProtocol)
    func openMainTiendaRouter(view:IndexViewControllerProtocol, user: User)
    static func createModule() -> UIViewController
}
