//
//  ComprasProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import UIKit
import CoreData

protocol ComprasViewControllerProtocol: UIViewController {
    var presenter: ComprasPresenterProtocol? {get set}
    var user: User? {get set}
    var product: ProductDetail? {get set}
    func recivedCompraFromCoreData(data: [NSManagedObject])
}

protocol ComprasPresenterProtocol: NSObject {
    var view: ComprasViewControllerProtocol? {get set}
    var interactor: ComprasInteractorProtocol? {get set}
    var router: ComprasRouterProtocol? {get set}
    
    var user: User? {get set}
    var product: ProductDetail? {get set}
    func recivedData()
    func getComprasCD()
}

protocol ComprasInteractorProtocol: NSObject{
    var output: ComprasInteractorOutputProtocol? {get set}
    func getComprasCoreData()
}

protocol ComprasInteractorOutputProtocol {
    func recivedCompraFromCD(data: [NSManagedObject])
}

protocol ComprasRouterProtocol {
    var presenter: ComprasPresenterProtocol? {get set}
    static func createModuleCompras(data: User?, product: ProductDetail?) -> UIViewController
}
