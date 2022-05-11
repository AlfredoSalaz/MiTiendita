//
//  DetailProductRouter.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

class DetailProductRouter: DetailProductRouterProtocol {
    var presenter: DetailProductPresenterProtocol?
    
    static func createModule() -> UIViewController {
        
        let view = storyboard.instantiateViewController(withIdentifier: "detailProductView") as! DetailProductViewController
        let presenter: DetailProductPresenterProtocol & DetailProductOutputProtocol = DetailProductPresenter()
        let interactor: DetailProductInteractorProtocol = DetailProductInteractor()
        
        var router: DetailProductRouterProtocol = DetailProductRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
        
    }
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name: "DetailProductStoryboard", bundle: nil)
    }
    func openViewComprasRouter(view: DetailProductViewControllerProtocol) {
        let vc = ComprasRouter.createModuleCompras()
        view.present(vc, animated: true)
    }
    func openEditProduct(view: DetailProductViewControllerProtocol, isEdit: Bool?) {
        let vc = RegisterProductsRouter.createModuleRegisterProduct(isEdit: isEdit)
        view.present(vc, animated: true)
    }
    
}
