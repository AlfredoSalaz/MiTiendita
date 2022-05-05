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
        let vc = RegisterCategoryRouter.createModuleRegisterCategory()
        view?.present(vc, animated: true)
    }
    func openListProduct(){
        let vc = UserRegisterProductsRouter.createModuleUserRegisterProducts()
        view?.present(vc, animated: true, completion: nil)
    }
    func openDetailProduct(data: ProductDetail){
        print("data \(data.title)")
        let vc = DetailProductRouter.createModule(data: data)
        view?.present(vc, animated: true, completion: nil)
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
