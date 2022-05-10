//
//  PerfilUserRegisterPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit

class PerfilUserRegisterPresenter: NSObject, PerfilUserRegisterPresenterProtocol{

    var view: PerfilUserRegisterViewControllerProtocol?

    var interactor: PerfilUserRegisterInteractorProtocol?

    var router: PerfilUserRegisterRouterProtocol?
    
    var isEdit: Bool?
    var user: User?
    func saveUserInfo(user: UsuarioCore) {
        interactor?.saveUserInfo(user: user)
    }
    func receicedUser(){
        view?.isEditiing = isEdit
        view?.user = user
    }
}


extension  PerfilUserRegisterPresenter: PerfilUserRegisterInteractorOutPutProtocol{
    
    
}
