//
//  IndexRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexRouter: IndexRouterProtocol{

    static func createModule() -> UIViewController {
        let main = storyboard
        let view = main.instantiateViewController(withIdentifier: "index") as! IndexViewController
        let presenter: IndexPresenterProtocol & IndexInteractorOutputProtocol = IndexPresenter()
        let interactor: IndexInteractorProtocol = IndexInteractor()
        let router: IndexRouterProtocol = IndexRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        
        return view
    }
    func openViewRegisters(view: IndexViewControllerProtocol){
        let viewController = UserRouter.createModuleUserRegister()
        view.present(viewController, animated: true)
    }
    func openMainTiendaRouter(view:IndexViewControllerProtocol, user: User){
        let viewController = MainAdminRouter.createModuleMainAdmin(user: user)
        view.present(viewController, animated: true)
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "IndexStoryboard", bundle: nil)
    }
}
