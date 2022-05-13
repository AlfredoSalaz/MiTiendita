//
//  RegisterTarjetaProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit
import CoreData
protocol RegisterTarjetaViewControllerProtocol: UIViewController{
    var presenter: RegisterTarjetaPresenterProtocol? {get set}
    func savedTarjetaInCoreData()
    var isEditt: Bool?{get set}
    var data: NSManagedObject? {get set}
}

protocol RegisterTarjetaPresenterProtocol: NSObject{
    var view: RegisterTarjetaViewControllerProtocol? {get set}
    var interactor: RegisterTarjetaInteractorProtocol? {get set}
    var router: RegisterTarjetaRouterProtocol? {get set}
    var isEditt: Bool?{get set}
    var object: NSManagedObject? {get set}
    func saveTarjeta(data: TarjetaModel?)
    func updateTrajeta(data: TarjetaModel?, object: NSManagedObject?)
    func deleteTarjeta(object: NSManagedObject?)
    func getTarjetas()
    func loadDataInView()
}

protocol RegisterTarjetaInteractorProtocol: NSObject{
    var output: RegisterTarjetaInteractorOutputProtocol? {get set}
    func saveTarjetas(data: TarjetaModel?)
    func updateTrajetas(data: TarjetaModel?, object: NSManagedObject?)
    func deleteTarjetas(object: NSManagedObject?)
    func getTarjeta()
}

protocol RegisterTarjetaInteractorOutputProtocol{
    func savedTarjetaInCD()
}

protocol RegisterTarjetaRouterProtocol {
    var presenter: RegisterTarjetaPresenterProtocol? {get set}
    static func createModuleTarjetas(isEditt: Bool?, data: NSManagedObject?) -> UIViewController
}
