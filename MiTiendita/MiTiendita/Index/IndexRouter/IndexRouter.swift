//
//  IndexRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexRouter: IndexRouterProtocol{
    var presenter: IndexPresenterProtocol?

    static func createModule() -> UIViewController {
        let main = storyboard
        let view = main.instantiateViewController(withIdentifier: "index") as! IndexViewController
        let presenter: IndexPresenterProtocol & IndexInteractorOutputProtocol = IndexPresenter()
        let interactor: IndexInteractorProtocol = IndexInteractor()
        var router: IndexRouterProtocol = IndexRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "IndexStoryboard", bundle: nil)
    }
}
