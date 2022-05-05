//
//  MainAdminRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit

class MainAdminRouter: MainAdminRouterProtocol {
    
    static func createModuleMainAdmin(user: User) -> UIViewController {
        print("---u \(user.name)")
        let view = mainstoryboard.instantiateViewController(withIdentifier: "mainAdmin") as! MainAdminViewController
        let presenter: MainAdminInteractorOutputProtocol & MainAdminPresenterProtocol = MainAdminPresenter()
        let interactor: MainAdminInteractorProtocol = MainAdminInteractor()
        let router: MainAdminRouterProtocol = MainAdminRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        presenter.recivedUser = user
        return view
    }
    
    func openRegisterCategoryRouter(view: MainAdminViewControllerProtocol){
        let vc = RegisterCategoryRouter.createModuleRegisterCategory()
        view.present(vc, animated: true)
    }
    func openListProduct(view: MainAdminViewControllerProtocol){
        let vc = UserRegisterProductsRouter.createModuleUserRegisterProducts()
        view.present(vc, animated: true, completion: nil)
    }
    func openDetailProduct(view:MainAdminViewControllerProtocol, data: ProductDetail){
        let vc = DetailProductRouter.createModule(data: data)
        view.present(vc, animated: true, completion: nil)
    }
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name: "MainAdminStoryboard", bundle: nil)
    }
}
