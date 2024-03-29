//
//  PerfilUserRegisterProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit
import CoreData

protocol PerfilUserRegisterViewControllerProtocol: UIViewController {
    var presenter: PerfilUserRegisterPresenterProtocol? {get set}
    var user: User? {get set}
    var isEditiing: Bool? {get set}
    //func receivedlistProduct(data: [UsuarioCore])
    func receivedlistUsers(data: [NSManagedObject])
    //func faillureData()
    
    func dismiss()
}

protocol PerfilUserRegisterPresenterProtocol : NSObject {
    var view: PerfilUserRegisterViewControllerProtocol? {get set}
    var interactor: PerfilUserRegisterInteractorProtocol? {get set}
    var router: PerfilUserRegisterRouterProtocol? {get set}
    
    var isEdit: Bool? {get set}
    var user: User? {get set}
    
    func receicedUser()
    func saveUserInfo(user: UsuarioCore)
    func getAllUserCore()
}

protocol PerfilUserRegisterInteractorProtocol : NSObject {
    var output: PerfilUserRegisterInteractorOutPutProtocol? {get set}
    
    func saveUserInfo(user: UsuarioCore)
    func getAllUserCore()
}

protocol PerfilUserRegisterInteractorOutPutProtocol : NSObject {
    
    func onRecivedUsers(data: [NSManagedObject])
    func dismiss()
    //func onRecivedFaillureData()
}

protocol PerfilUserRegisterRouterProtocol {
    var presenter: PerfilUserRegisterPresenterProtocol? {get set}
    static func createModulePerfilUserRegister(user: User?, isEdditing: Bool) -> UIViewController
    //static func createModulePerfilUserRegister() -> UIViewController
    //func iniciarModuloPerfilUserRegister()
}
