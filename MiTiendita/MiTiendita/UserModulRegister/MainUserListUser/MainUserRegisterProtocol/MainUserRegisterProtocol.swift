//
//  MainUserRegisterProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

//View
protocol MainUserRegisterViewControllerProtocol: UIViewController{
    var presenter: MainUserRegisterPresentProtocol? {get set}
    
    func datosObtenidosUser(data: [NSManagedObject])
    func getUsuarios()

}

//Interactor
protocol MainUserRegisterInteractorProtocol: NSObject{
    var output: MainUserRegisterOutputProtocol? {get set}
    
    func getUsuarios()

    
}

//Presenter
protocol MainUserRegisterPresentProtocol: NSObject{
    var view: MainUserRegisterViewControllerProtocol? {get set}
    var interactor: MainUserRegisterInteractorProtocol? {get set}
    var router: MainUserRegisterRouterProtocol? {get set}
    
    func getUsuarios()
    
    func agregarNuevoUsuario()
    
}

//Entity
protocol MainUserRegisterOutputProtocol: NSObject{
    
    func datosObtenidosUser(data: [NSManagedObject])
}

//Router
protocol MainUserRegisterRouterProtocol {
    var presenter: MainUserRegisterPresentProtocol? {get set}
    
    func openViewNuevoUsuario(view: MainUserRegisterViewControllerProtocol)
    
    static func createModule() -> UIViewController
}
