//
//  IndexPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexPresenter: NSObject, IndexPresenterProtocol{
    var router: IndexRouterProtocol?
    var interactor: IndexInteractorProtocol?
    var view: IndexViewControllerProtocol?
    
    func openMainTienda(user: User) {
        router?.openMainTiendaRouter(view: view!, user: user)
    }
    func openViewRegister(){
        router?.openViewRegisters(view: view!)
    }
    
    func getAllUser() {
        interactor?.getAllUsers()
    }
    
}

extension IndexPresenter: IndexInteractorOutputProtocol{
    func onRecivedUser(data: [User]) {
        view?.recivedAllUser(data: data)
    }
}
