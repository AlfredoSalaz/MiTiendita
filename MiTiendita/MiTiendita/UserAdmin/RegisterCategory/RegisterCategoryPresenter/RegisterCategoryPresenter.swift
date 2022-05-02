//
//  RegisterCategoryPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

class RegisterCategoryPresenter: NSObject, RegisterCategoryPresenterProtocol{
    var view: RegisterCategoryViewControllerProtocol?
    var interactor: RegisterCategoryInteractorProtocol?
    var router: RegisterCategoryRouterProtocol?
    
    func saveCategory() {
        interactor?.savedCategory()
    }
}

extension RegisterCategoryPresenter: RegisterCategoryInteractorOutputProtocol{
    
}
