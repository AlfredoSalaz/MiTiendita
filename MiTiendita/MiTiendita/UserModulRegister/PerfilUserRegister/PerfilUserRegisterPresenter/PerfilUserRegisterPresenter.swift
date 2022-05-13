//
//  PerfilUserRegisterPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit
import CoreData

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
    
    func getAllUserCore() {
        interactor?.getAllUserCore()
    }
}

extension  PerfilUserRegisterPresenter: PerfilUserRegisterInteractorOutPutProtocol{
    func dismiss() {
        view?.dismiss()
    }
    
    func onRecivedUsers(data: [NSManagedObject]) {
        view?.receivedlistUsers(data: data)
    }
}
