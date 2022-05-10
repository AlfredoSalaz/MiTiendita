//
//  RegisterCategoryRouter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit
import CoreData

class RegisterCategoryRouter: RegisterCategoryRouterProtocol {
    var presenter: RegisterCategoryPresenterProtocol?
    
    static func createModuleRegisterCategory(data: CategoryProduct?, isEdit: Bool?, objectCoreData: NSManagedObject?) -> UIViewController {
        let view = storyboard.instantiateViewController(withIdentifier: "registerCategory") as! RegisterCategoryViewController
        let presenter: RegisterCategoryPresenterProtocol & RegisterCategoryInteractorOutputProtocol = RegisterCategoryPresenter()
        let interactor: RegisterCategoryInteractorProtocol = RegisterCategoryInteractor()
        var router: RegisterCategoryRouterProtocol = RegisterCategoryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.presenter = presenter
        presenter.isEditPre = isEdit
        presenter.categoryPre = data
        presenter.objectCoreDataa = objectCoreData
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "RegisterCategoryStoryboard", bundle: nil)
    }
}
