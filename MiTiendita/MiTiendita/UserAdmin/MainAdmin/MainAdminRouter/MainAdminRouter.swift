//
//  MainAdminRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit

class MainAdminRouter: MainAdminRouterProtocol {
    var presenter: MainAdminPresenterProtocol?
    
    static func createModuleMainAdmin() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "mainAdmin") as! MainAdminViewController
        let presenter: MainAdminInteractorOutputProtocol & MainAdminPresenterProtocol = MainAdminPresenter()
        let interactor: MainAdminInteractorProtocol = MainAdminInteractor()
        var router: MainAdminRouterProtocol = MainAdminRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "MainAdminStoryboard", bundle: nil)
    }
}
