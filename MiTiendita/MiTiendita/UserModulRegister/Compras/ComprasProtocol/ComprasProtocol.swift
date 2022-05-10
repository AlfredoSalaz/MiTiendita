//
//  ComprasProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import UIKit

protocol ComprasViewControllerProtocol: UIViewController {
    var presenter: ComprasPresenterProtocol? {get set}
}

protocol ComprasPresenterProtocol: NSObject {
    var view: ComprasViewControllerProtocol? {get set}
    var interactor: ComprasInteractorProtocol? {get set}
    var router: ComprasRouterProtocol? {get set}
    
}

protocol ComprasInteractorProtocol: NSObject{
    var output: ComprasInteractorOutputProtocol? {get set}
}

protocol ComprasInteractorOutputProtocol {
    
}

protocol ComprasRouterProtocol {
    var presenter: ComprasPresenterProtocol? {get set}
    static func createModuleCompras(data: User?) -> UIViewController
}
