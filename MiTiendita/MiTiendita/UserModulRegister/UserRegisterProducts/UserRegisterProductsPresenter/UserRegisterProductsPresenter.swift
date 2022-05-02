//
//  UserRegisterProductsPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit


class UserRegisterProductsPresenter: NSObject, UserRegisterProductsPresenterProtocol{
    
    var view: UserRegisterProductsViewControllerProtocol?
    
    var interactor: UserRegisterProductsInteractorProtocol?
    
    var router: UserRegisterProductsRouterProtocol?
    
    
}

extension UserRegisterProductsPresenter: UserRegisterProductsOutputProtocol{
    
}
