//
//  UserRouter.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

class UserRouter: UserRouterProtocol{
    var presenter: UserPresenterProtocol?

    static func createModuleUserRegister() -> UIViewController {
        let view = storyboard.instantiateViewController(withIdentifier: "user") as! UserViewController
        let presenter: UserPresenterProtocol & UserInteractorOutputProtocol = UserPresenter()
        let interactor: UserInteractorProtocol = UserInteractor()
        var router: UserRouterProtocol = UserRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "UserStoryboard", bundle: nil)
    }
}
