//
//  HistoryComprasRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import UIKit

class HistoryComprasRouter: HistoryComprasRouterProtocol{
    var presenter: HistoryComprasPresenterProtocol?
    
    static func createModuleHistoryCompras() -> UIViewController {
        let view = story.instantiateViewController(withIdentifier: "history") as! HistoryComprasViewController
        let presenter: HistoryComprasPresenterProtocol & HistoryComprasInteractorOutputProtocol = HistoryComprasPresenter()
        let interactor: HistoryComprasInteractorProtocol = HistoryComprasInteractor()
        var router: HistoryComprasRouterProtocol = HistoryComprasRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    static var story: UIStoryboard{
        return UIStoryboard(name: "HistoryComprasStoryboard", bundle: nil)
    }
}
