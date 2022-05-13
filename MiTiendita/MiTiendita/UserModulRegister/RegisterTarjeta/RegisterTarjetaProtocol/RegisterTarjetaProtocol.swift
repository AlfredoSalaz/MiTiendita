//
//  RegisterTarjetaProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

protocol RegisterTarjetaViewControllerProtocol: UIViewController{
    var presenter: RegisterTarjetaPresenterProtocol? {get set}
    func savedTarjetaInCoreData()
}

protocol RegisterTarjetaPresenterProtocol: NSObject{
    var view: RegisterTarjetaViewControllerProtocol? {get set}
    var interactor: RegisterTarjetaInteractorProtocol? {get set}
    var router: RegisterTarjetaRouterProtocol? {get set}
    
    func saveTarjeta(data: TarjetaModel?)
    func updateTrajeta()
    func deleteTarjeta()
    func getTarjetas()
}

protocol RegisterTarjetaInteractorProtocol: NSObject{
    var output: RegisterTarjetaInteractorOutputProtocol? {get set}
    func saveTarjetas(data: TarjetaModel?)
    func updateTrajetas()
    func deleteTarjetas()
    func getTarjeta()
}

protocol RegisterTarjetaInteractorOutputProtocol{
    func savedTarjetaInCD()
}

protocol RegisterTarjetaRouterProtocol {
    var presenter: RegisterTarjetaPresenterProtocol? {get set}
    static func createModuleTarjetas() -> UIViewController
}
