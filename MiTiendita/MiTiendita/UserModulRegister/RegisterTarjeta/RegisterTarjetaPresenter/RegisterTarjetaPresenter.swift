//
//  RegisterTarjetaPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

class RegisterTarjetaPresenter: NSObject, RegisterTarjetaPresenterProtocol{
    
    var view: RegisterTarjetaViewControllerProtocol?
    var interactor: RegisterTarjetaInteractorProtocol?
    var router: RegisterTarjetaRouterProtocol?
    
    func saveTarjeta(data: TarjetaModel?) {
        interactor?.saveTarjetas(data: data)
    }
    
    func updateTrajeta() {
        interactor?.updateTrajetas()
    }
    
    func deleteTarjeta() {
        interactor?.deleteTarjetas()
    }
    
    func getTarjetas() {
        interactor?.getTarjeta()
    }
    
}

extension RegisterTarjetaPresenter: RegisterTarjetaInteractorOutputProtocol {
    func savedTarjetaInCD(){
        view?.savedTarjetaInCoreData()
    }
}
