//
//  MainAdminPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit

class MainAdminPresenter: NSObject, MainAdminPresenterProtocol{
    var view: MainAdminViewControllerProtocol?
    var interactor: MainAdminInteractorProtocol?
    var router: MainAdminRouterProtocol?
    var recivedUser: User?    
    func openEditUser(user: User, isEdditing: Bool){
        let vc = PerfilUserRegisterRouter.createModulePerfilUserRegister(user: user, isEdditing: isEdditing)
        view?.present(vc, animated: true)
        
    }
    func getCategories() {
        interactor?.getCategoriesProduct()
    }
    func getProduct() {
        interactor?.getProducts()
    }
    func openRegisterCategory() {
        router?.openRegisterCategoryRouter(view: view!)
    }
    func openListProduct(){
        router?.openListProduct(view: view!)
    }
    func openDetailProduct(data: ProductDetail){
        router?.openDetailProduct(view: view!, data: data)
    }
    func recivedDataFromIndex(){
        view?.recivedDataFromPresenter(data: recivedUser!)
    }
}

extension MainAdminPresenter: MainAdminInteractorOutputProtocol{
    func onRecivedCategory(data: [CategoryProduct]) {
        view?.onReceivedCategoryProduct(data: data)
    }
    func onRecibiProducto(data: [Product]) {
        view?.onReceivedlistProduct(data: data)
    }
    func onRecivedFaillureData() {
        view?.faillureData()
    }
}
