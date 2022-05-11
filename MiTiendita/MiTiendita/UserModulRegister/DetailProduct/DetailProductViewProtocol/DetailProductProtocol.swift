//
//  DetailProductProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

//View
protocol DetailProductViewControllerProtocol: UIViewController {
    var presenter: DetailProductPresenterProtocol? {get set}
    func saveCompraCoreData()
}

//Interactor
protocol DetailProductInteractorProtocol: NSObject {
    var output: DetailProductOutputProtocol? {get set}
    func savedCompraUser(compra: ComprasUser)
}

//Presenter
protocol DetailProductPresenterProtocol: NSObject {
    var view: DetailProductViewControllerProtocol? {get set}
    var interactor: DetailProductInteractorProtocol? {get set}
    var router: DetailProductRouterProtocol? {get set}
    
    func openViewCompras()
    func openEditProducts(isEdit: Bool?)
    func saveCompraUser(compra: ComprasUser)
}

//Output
protocol DetailProductOutputProtocol: NSObject {
    func savedCompraCD()
}

//Router
protocol DetailProductRouterProtocol{
    var presenter: DetailProductPresenterProtocol? {get set}
    static func createModule() -> UIViewController
    func openViewComprasRouter(view: DetailProductViewControllerProtocol)
    func openEditProduct(view: DetailProductViewControllerProtocol, isEdit: Bool?)
}



