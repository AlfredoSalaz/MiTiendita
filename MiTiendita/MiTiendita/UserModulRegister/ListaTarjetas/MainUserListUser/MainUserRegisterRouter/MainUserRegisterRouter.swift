//
//  MainUserRegisterRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import Alamofire

class MainUserRegisterRouter: MainUserRegisterRouterProtocol {
    
    var presenter: MainUserRegisterPresentProtocol?
    
    static func createModule() -> UIViewController{
        
        let main = storyboard
        
        let view = main.instantiateViewController(withIdentifier: "mainUserRegister") as! MainUserRegisterViewController
        let presenter: MainUserRegisterPresentProtocol & MainUserRegisterOutputProtocol = MainUserRegisterPresenter()
        let interactor: MainUserRegisterInteractorProtocol = MainUserRegisterInteractor()
        var router: MainUserRegisterRouterProtocol = MainUserRegisterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    func openViewNuevoUsuario(view: MainUserRegisterViewControllerProtocol) {
        
        let views = PerfilUserRegisterRouter.createModulePerfilUserRegister(user: nil, isEdditing: false)
        view.present(views, animated: true)
        
    }
    
    
    static var storyboard:UIStoryboard{
        return UIStoryboard(name: "MainUserRegisterStoryboard", bundle: nil)
    }
}
