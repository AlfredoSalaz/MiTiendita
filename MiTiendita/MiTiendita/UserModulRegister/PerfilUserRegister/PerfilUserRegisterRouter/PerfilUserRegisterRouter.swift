//
//  PerfilUserRegisterRouter.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit

class PerfilUserRegisterRouter: PerfilUserRegisterRouterProtocol{
    
    var presenter: PerfilUserRegisterPresenterProtocol?
    
    //static func createModulePerfilUserRegister(user: User, isEdditing: Bool) -> UIViewController{
    static func createModulePerfilUserRegister(user: User?, isEdditing: Bool) -> UIViewController{
        print("Se inicio")
        
        let view = storyboard.instantiateViewController(withIdentifier: "PerfilUserRegister") as! PerfilUserRegisterViewController
        let presenter : PerfilUserRegisterPresenterProtocol & PerfilUserRegisterInteractorOutPutProtocol = PerfilUserRegisterPresenter()
        let interactor : PerfilUserRegisterInteractorProtocol = PerfilUserRegisterInteractor()
        var router: PerfilUserRegisterRouterProtocol = PerfilUserRegisterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        presenter.user = user
        presenter.isEdit = isEdditing
        return view
        
    }
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "PerfilUserRegisterStoryboard", bundle: nil)
    }
    
}
