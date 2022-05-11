//
//  DetailProductRouter.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

class DetailProductRouter: DetailProductRouterProtocol {
    var presenter: DetailProductPresenterProtocol?
    
    static func createModule(data: ProductDetail) -> UIViewController {
        
        let view = storyboard.instantiateViewController(withIdentifier: "detailProductView") as! DetailProductViewController
        let presenter: DetailProductPresenterProtocol & DetailProductOutputProtocol = DetailProductPresenter()
        let interactor: DetailProductInteractorProtocol = DetailProductInteractor()
        
        var router: DetailProductRouterProtocol = DetailProductRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.product = data
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
        
    }
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name: "DetailProductStoryboard", bundle: nil)
    }
    func openViewComprasRouter(product: ProductDetail?, view: DetailProductViewControllerProtocol) {
        let vc = ComprasRouter.createModuleCompras(product: product)
        view.present(vc, animated: true)
    }
    
}
