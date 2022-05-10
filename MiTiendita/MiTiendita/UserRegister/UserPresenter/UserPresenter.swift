//
//  UserPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

class UserPresenter: NSObject, UserPresenterProtocol{

    var view: UserViewControllerProtocol?
    var interactor: UserInteractorProtocol?
    var router: UserRouterProtocol?
    
    func saveUserApi(user: [String : Any]) {
        interactor?.saveUserApi(user: user)
    }
}

extension UserPresenter: UserInteractorOutputProtocol{
    func dismissWindow() {
        view?.dismissWindow()
    }
    
    
}
