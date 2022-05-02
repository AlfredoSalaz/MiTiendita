//
//  MainTiendaProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

protocol MainTiendaViewControllerProtocol: UIViewController {
    var presenter: MainTiendaPresenterProtocol? {get set}
    var user: String? {get set}
}

protocol MainTiendaPresenterProtocol: NSObject{
    var view: MainTiendaViewControllerProtocol? {get set}
    var interactor: MainTiendaInteractorProtocol? {get set}
    var router: MainTiendaRouterProtocol? {get set}
}

protocol MainTiendaInteractorProtocol: NSObject{
    var output: MainTiendaInteractorOutputProtocol? {get set}
}

protocol MainTiendaInteractorOutputProtocol: NSObject {
    
}

protocol MainTiendaRouterProtocol{
    var presenter: MainTiendaPresenterProtocol? {get set}
    static func createModuleMainTienda(typeUser: String) -> UIViewController
}
