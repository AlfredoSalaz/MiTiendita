//
//  PerfilUserRegisterProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit

protocol PerfilUserRegisterViewControllerProtocol: UIViewController {
    var presenter: PerfilUserRegisterPresenterProtocol? {get set}
}

protocol PerfilUserRegisterPresenterProtocol : NSObject {
    var view: PerfilUserRegisterViewControllerProtocol? {get set}
    var interactor: PerfilUserRegisterInteractorProtocol? {get set}
    var router: PerfilUserRegisterRouterProtocol? {get set}
}

protocol PerfilUserRegisterInteractorProtocol : NSObject {
    var output: PerfilUserRegisterInteractorOutPutProtocol? {get set}
}

protocol PerfilUserRegisterInteractorOutPutProtocol : NSObject {
    
}

protocol PerfilUserRegisterRouterProtocol {
    var presenter: PerfilUserRegisterPresenterProtocol? {get set}
}
