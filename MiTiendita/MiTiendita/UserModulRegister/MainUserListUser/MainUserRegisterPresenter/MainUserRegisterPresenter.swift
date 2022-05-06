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
    
}


extension MainUserRegisterPresenter: MainUserRegisterOutputProtocol{
    func datosObtenidosUser(data: [NSManagedObject]) {
        view?.datosObtenidosUser(data: data)
        print("Aqui va la info")
        print(data)
    }
    
    
}
