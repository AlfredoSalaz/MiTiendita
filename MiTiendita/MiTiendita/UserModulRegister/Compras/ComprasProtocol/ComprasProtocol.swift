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
    var product: ProductDetail? {get set}
    func recivedCompraFromCoreData(data: [NSManagedObject])
    func deletedObjectSuccessInCD()
}

protocol ComprasPresenterProtocol: NSObject {
    var view: ComprasViewControllerProtocol? {get set}
    var interactor: ComprasInteractorProtocol? {get set}
    var router: ComprasRouterProtocol? {get set}
    
    var product: ProductDetail? {get set}
    func recivedData()
    func getComprasCD()
    func updateCompraUserCar(compra: ComprasUser, object: NSManagedObject?)
    func deleteCompraUser(object: NSManagedObject?)
}

protocol ComprasInteractorProtocol: NSObject{
    var output: ComprasInteractorOutputProtocol? {get set}
    func getComprasCoreData()
    func updateCompraUserCarr(compra: ComprasUser, object: NSManagedObject?)
    func deleteCompraUserCD(object: NSManagedObject?)
}

protocol ComprasInteractorOutputProtocol {
    func recivedCompraFromCD(data: [NSManagedObject])
    func deletedObjectSuccess()
}

protocol ComprasRouterProtocol {
    var presenter: ComprasPresenterProtocol? {get set}
    static func createModuleCompras(product: ProductDetail?) -> UIViewController
}
