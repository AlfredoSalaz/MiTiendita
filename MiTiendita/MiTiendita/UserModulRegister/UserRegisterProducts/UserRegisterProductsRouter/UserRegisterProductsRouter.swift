//
//  UserRegisterProductsRouter.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit

class UserRegisterProductsRouter: UserRegisterProductsRouterProtocol{
    
    var presenter: UserRegisterProductsPresenterProtocol?
    
    static func createModuleUserRegisterProducts() -> UIViewController{
        
        let view = storyboard.instantiateViewController(withIdentifier: "userRegisterProducts") as! UserRegisterProductsViewController
        
        let presenter : UserRegisterProductsPresenterProtocol & UserRegisterProductsOutputProtocol = UserRegisterProductsPresenter()
        
        let interactor : UserRegisterProductsInteractorProtocol = UserRegisterProductsInteractor()
        
        var router : UserRegisterProductsRouterProtocol = UserRegisterProductsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name: "UserRegisterProductsStoryboard", bundle: nil)
    }
    
}


