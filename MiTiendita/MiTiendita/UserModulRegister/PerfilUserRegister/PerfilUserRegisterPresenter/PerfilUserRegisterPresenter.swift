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
    
}


extension  PerfilUserRegisterPresenter: PerfilUserRegisterInteractorOutPutProtocol{
    
}
