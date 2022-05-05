//
//  DetailProductRouter.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

class DetailProductRouter: DetailProductRouterProtocol {
    
    static func createModule(data: ProductDetail) -> UIViewController {
        
        let view = storyboard.instantiateViewController(withIdentifier: "detailProductView") as! DetailProductViewController
        let presenter: DetailProductPresenterProtocol & DetailProductOutputProtocol = DetailProductPresenter()
        let interactor: DetailProductInteractorProtocol = DetailProductInteractor()
        
        let router: DetailProductRouterProtocol = DetailProductRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.product = data
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        
        return view
        
    }
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name: "DetailProductStoryboard", bundle: nil)
    }
    
}
