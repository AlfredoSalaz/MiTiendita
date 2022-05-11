//
//  UserProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

protocol UserViewControllerProtocol: UIViewController{
    var presenter: UserPresenterProtocol? {get set}
    func dismissWindow()
    func errorCheckEmail(user: ValidateEmail)
    
}
protocol UserPresenterProtocol: NSObject{
    var view: UserViewControllerProtocol? {get set}
    var interactor: UserInteractorProtocol? {get set}
    var router: UserRouterProtocol?{get set}
    
    
    func saveUserApi(user: [String: Any])
}

protocol UserInteractorProtocol: NSObject{
    var output: UserInteractorOutputProtocol? {get set}
    
    func saveUserApi(user: [String: Any])
    func trySavedUserApi(user: [String: Any])
}
protocol UserInteractorOutputProtocol {
    func dismissWindow()
    func errorCheckEmail(user: ValidateEmail)
    
}
protocol UserRouterProtocol {
    var presenter: UserPresenterProtocol? {get set}
    static func createModuleUserRegister() -> UIViewController
}
