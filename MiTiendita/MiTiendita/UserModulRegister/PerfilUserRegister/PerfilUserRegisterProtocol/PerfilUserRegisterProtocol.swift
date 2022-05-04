//
//  PerfilUserRegisterProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit

protocol PerfilUserRegisterViewControllerProtocol: UIViewController {
    var presenter: PerfilUserRegisterPresenterProtocol? {get set}
    var user: User? {get set}
    
    //func receivedlistProduct(data: [UsuarioCore])
    //func faillureData()
}

protocol PerfilUserRegisterPresenterProtocol : NSObject {
    var view: PerfilUserRegisterViewControllerProtocol? {get set}
    var interactor: PerfilUserRegisterInteractorProtocol? {get set}
    var router: PerfilUserRegisterRouterProtocol? {get set}
    
    func saveUserInfo(user: UsuarioCore)
    
    
}

protocol PerfilUserRegisterInteractorProtocol : NSObject {
    var output: PerfilUserRegisterInteractorOutPutProtocol? {get set}
    
    func saveUserInfo(user: UsuarioCore)
    
}

protocol PerfilUserRegisterInteractorOutPutProtocol : NSObject {
    
    //func onRecivedproducts(data: [UsuarioCore])
    //func onRecivedFaillureData()
}

protocol PerfilUserRegisterRouterProtocol {
    var presenter: PerfilUserRegisterPresenterProtocol? {get set}
    static func createModulePerfilUserRegister(user: User, isEdditing: Bool) -> UIViewController
}
