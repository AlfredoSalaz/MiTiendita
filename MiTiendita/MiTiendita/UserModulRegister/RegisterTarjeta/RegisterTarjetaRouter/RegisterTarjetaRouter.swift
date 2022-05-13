//
//  RegisterTarjetaRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

class RegisterTarjetaRouter: RegisterTarjetaRouterProtocol {
    var presenter: RegisterTarjetaPresenterProtocol?
    static func createModuleTarjetas() -> UIViewController {
        let view = story.instantiateViewController(withIdentifier: "tarjeta") as! RegisterTarjetaViewController
        let presenter: RegisterTarjetaPresenterProtocol & RegisterTarjetaInteractorOutputProtocol = RegisterTarjetaPresenter()
        let interactor: RegisterTarjetaInteractorProtocol = RegisterTarjetaInteractor()
        var router: RegisterTarjetaRouterProtocol = RegisterTarjetaRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        return view
    }
    
    static var story: UIStoryboard{
        return UIStoryboard(name: "RegisterTarjetaStoryboard", bundle: nil)
    }
}
