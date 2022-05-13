//
//  HistoryComprasProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import UIKit
import CoreData

protocol HistoryComprasViewControllerProtocol: UIViewController{
    var presenter: HistoryComprasPresenterProtocol?{get set}
    func successGetHistoryCompra(data: [NSManagedObject])
}
protocol HistoryComprasPresenterProtocol: NSObject{
    var view: HistoryComprasViewControllerProtocol? {get set}
    var interactor: HistoryComprasInteractorProtocol?{get set}
    var router: HistoryComprasRouterProtocol?{get set}
    func getListHistory()
}

protocol HistoryComprasInteractorProtocol: NSObject {
    var output: HistoryComprasInteractorOutputProtocol?{get set}
    func getListaHistory()
}

protocol HistoryComprasInteractorOutputProtocol{
    func successGetHistory(data: [NSManagedObject])
}

protocol HistoryComprasRouterProtocol {
    var presenter: HistoryComprasPresenterProtocol?{get set}
    static func createModuleHistoryCompras()-> UIViewController
}
