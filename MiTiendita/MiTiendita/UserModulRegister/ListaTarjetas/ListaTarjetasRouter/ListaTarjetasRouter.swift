//
//  ListaTarjetasRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

class ListaTarjetasRouter: ListaTarjetasRouterProtocol {
    var presenter: ListaTarjetasPresenterProtocol?
    
    static func createModuloListaTarjeta() -> UIViewController {
        let view = story.instantiateViewController(withIdentifier: "listaTarjetas") as! ListaTarjetasViewController
        let presenter: ListaTarjetasPresenterProtocol & ListaTarjetasInteractorOutputProtocol = ListaTarjetasPresenter()
        let interactor: ListaTarjetasInteractorProtocol = ListaTarjetasInteractor()
        var router: ListaTarjetasRouterProtocol = ListaTarjetasRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        return view
    }
    
    static var story: UIStoryboard{
        return UIStoryboard(name: "ListaTarjetasStoryboard", bundle: nil)
    }
    
}
