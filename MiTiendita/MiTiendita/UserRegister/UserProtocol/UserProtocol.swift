//
//  UserProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

protocol UserViewControllerProtocol: UIViewController{
    var presenter: UserPresenterProtocol? {get set}
    
}
protocol UserPresenterProtocol: NSObject{
    var view: UserViewControllerProtocol? {get set}
    var interactor: UserInteractorProtocol? {get set}
    var router: UserRouterProtocol?{get set}
    
}

protocol UserInteractorProtocol: NSObject{
    var output: UserInteractorOutputProtocol? {get set}
}
protocol UserInteractorOutputProtocol {
    
}
protocol UserRouterProtocol {
    var presenter: UserPresenterProtocol? {get set}
    static func createModuleUserRegister() -> UIViewController
}
