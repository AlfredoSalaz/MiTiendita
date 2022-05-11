//
//  RegisterProductsRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import UIKit

class RegisterProductsRouter: RegisterProductsRouterProtocol {
    var presenter: RegisterProductsPresenterProtocol?
    
    static func createModuleRegisterProduct(isEdit: Bool?) -> UIViewController {
        let view = main.instantiateViewController(withIdentifier: "registerProducts") as! RegisterProductsViewController
        let presenter: RegisterProductsPresenterProtocol & RegisterProductsInteractorOutputProtocol = RegisterProductsPresenter()
        let interactor: RegisterProductsInteractorProtocol = RegisterProductsInteractor()
        var router: RegisterProductsRouterProtocol = RegisterProductsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter
        router.presenter = presenter
        presenter.isEditt = isEdit
        return view
    }
    
    static var main: UIStoryboard{
        return UIStoryboard(name: "RegisterProductsStoryboard", bundle: nil)
    }
}
