//
//  ComprasRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import UIKit

class ComprasRouter: ComprasRouterProtocol {
    var presenter: ComprasPresenterProtocol?
    
    static func createModuleCompras() -> UIViewController {
        let view = storyboard.instantiateViewController(withIdentifier: "compras") as! ComprasViewController
        let presenter: ComprasPresenterProtocol & ComprasInteractorOutputProtocol = ComprasPresenter()
        let interactor: ComprasInteractorProtocol = ComprasInteractor()
        var router: ComprasRouterProtocol = ComprasRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        return view
    }
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name: "ComprasStoryboard", bundle: nil)
    }
}
