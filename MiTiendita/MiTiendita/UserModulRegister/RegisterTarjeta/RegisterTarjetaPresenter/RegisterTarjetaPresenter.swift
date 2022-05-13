//
//  RegisterTarjetaPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit
import CoreData

class RegisterTarjetaPresenter: NSObject, RegisterTarjetaPresenterProtocol{
    var view: RegisterTarjetaViewControllerProtocol?
    var interactor: RegisterTarjetaInteractorProtocol?
    var router: RegisterTarjetaRouterProtocol?
    var isEditt: Bool?
    var object: NSManagedObject?
    
    func saveTarjeta(data: TarjetaModel?) {
        interactor?.saveTarjetas(data: data)
    }
    
    func updateTrajeta(data: TarjetaModel?, object: NSManagedObject?) {
        interactor?.updateTrajetas(data: data, object: object)
    }
    
    func deleteTarjeta(object: NSManagedObject?) {
        interactor?.deleteTarjetas(object: object)
    }
    
    func getTarjetas() {
        interactor?.getTarjeta()
    }
    func loadDataInView() {
        view?.isEditt = isEditt
        view?.data = object
    }
}

extension RegisterTarjetaPresenter: RegisterTarjetaInteractorOutputProtocol {
    func savedTarjetaInCD(){
        view?.savedTarjetaInCoreData()
    }
}
