//
//  MainUserRegisterPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

class MainUserRegisterPresenter: NSObject, MainUserRegisterPresentProtocol{

    var view: MainUserRegisterViewControllerProtocol?
    
    var interactor: MainUserRegisterInteractorProtocol?
    
    var router: MainUserRegisterRouterProtocol?
    
    func getUsuarios() {
        interactor?.getUsuarios()
    }
    
    func agregarNuevoUsuario() {
        print("Voyyy")
        router?.openViewNuevoUsuario(view: view!)
    }
    
}


extension MainUserRegisterPresenter: MainUserRegisterOutputProtocol{
    func datosObtenidosUser(data: [User]) {
        view?.datosObtenidosUser(data: data)
    }
    
}
