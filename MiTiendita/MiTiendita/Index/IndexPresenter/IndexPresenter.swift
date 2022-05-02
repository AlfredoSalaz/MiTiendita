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
    
    func openMainTienda(tipeUser: String) {
        let viewController = MainAdminRouter.createModuleMainAdmin()
        //view?.navigationController?.pushViewController(viewController, animated: true)
        view?.present(viewController, animated: true)
    }
    func openViewRegister(){
        let viewController = UserRouter.createModuleUserRegister()
        view?.present(viewController, animated: true)
    }
    
}

extension IndexPresenter: IndexInteractorOutputProtocol{
    
}
