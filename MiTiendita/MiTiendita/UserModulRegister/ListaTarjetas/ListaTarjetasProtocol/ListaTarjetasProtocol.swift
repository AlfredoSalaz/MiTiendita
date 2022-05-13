//
//  ListaTarjetasProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit
import CoreData

protocol ListaTarjetasViewControllerProtocol: UIViewController{
    var presenter: ListaTarjetasPresenterProtocol? {get set}
    func onReciveListCards(data: [NSManagedObject])
}

protocol ListaTarjetasPresenterProtocol: NSObject{
    var view: ListaTarjetasViewControllerProtocol? {get set}
    var interactor: ListaTarjetasInteractorProtocol? {get set}
    var router: ListaTarjetasRouterProtocol? {get set}
    
    func loadCards()
}
protocol ListaTarjetasInteractorProtocol: NSObject{
    var output: ListaTarjetasInteractorOutputProtocol? {get set}
    func loadCardsData()
}

protocol ListaTarjetasInteractorOutputProtocol {
    func onRecivedListCards(data: [NSManagedObject])
}

protocol ListaTarjetasRouterProtocol{
    var presenter: ListaTarjetasPresenterProtocol? {get set}
    static func createModuloListaTarjeta() -> UIViewController
}
