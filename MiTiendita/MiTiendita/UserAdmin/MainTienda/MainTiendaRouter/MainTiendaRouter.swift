//
//  MainTiendaRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class MainTiendaRouter: MainTiendaRouterProtocol {
    var presenter: MainTiendaPresenterProtocol?
    
    static func createModuleMainTienda(typeUser: String) -> UIViewController {
        let view = main.instantiateViewController(withIdentifier: "mainTienda") as! MainTiendaViewController
        let presenter: MainTiendaPresenterProtocol & MainTiendaInteractorOutputProtocol = MainTiendaPresenter()
        let interactor: MainTiendaInteractorProtocol = MainTiendaInteractor()
        var router: MainTiendaRouterProtocol = MainTiendaRouter()
        
        view.presenter = presenter
        view.user = typeUser
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    static var main: UIStoryboard{
        return UIStoryboard(name: "MainTiendaStoryboard", bundle: nil)
    }
    
}
