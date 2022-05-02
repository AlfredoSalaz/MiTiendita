//
//  MainTiendaPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class MainTiendaPresenter: NSObject, MainTiendaPresenterProtocol {
    var view: MainTiendaViewControllerProtocol?
    
    var interactor: MainTiendaInteractorProtocol?
    
    var router: MainTiendaRouterProtocol?
    
    
}

extension MainTiendaPresenter: MainTiendaInteractorOutputProtocol{
    
}
