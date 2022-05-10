//
//  MainAdminPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//
import  CoreData
import UIKit

class MainAdminPresenter: NSObject, MainAdminPresenterProtocol{
    
    var view: MainAdminViewControllerProtocol?
    var interactor: MainAdminInteractorProtocol?
    var router: MainAdminRouterProtocol?
    var recivedUser: User?
    /*
    func openEditUser(user: User, isEdditing: Bool){
        let vc = PerfilUserRegisterRouter.createModulePerfilUserRegister(user: user, isEdditing: isEdditing)
        view?.present(vc, animated: true)
        
    }
     */
    func openEditUser(user: User?, isEdditing: Bool) {
        router?.openEditUser(view: view!, isEdit: true, user: user)
    }
    
    
    func openViewUser() {
        router?.openListUsuers(View: view!)
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
    func editCategory(data: CategoryProduct, isEdit: Bool, objectCoreData: NSManagedObject) {
        router?.editCategoryRouter(view: view!, data: data, isEdit: isEdit, objectCoreData: objectCoreData)
    }
    func openListProduct(){
        router?.openListProduct(view: view!)
    }
    func openDetailProduct(data: ProductDetail, user: User?){
        router?.openDetailProduct(view: view!, data: data, user: user)
    }
    func recivedDataFromIndex(){
        view?.recivedDataFromPresenter(data: recivedUser!)
    }
    func getCategoryCoreD() {
        interactor?.getCategoryCoreData()
    }
    func resetEntityCoreData(name: String) {
        interactor?.resetDataEntityCoreData(name: name)
    }
    func saveCategoryInCoreData(data: CategoryRegister) {
        interactor?.saveCategoryCoreData(data: data)
    }
    func getProductCoreData() {
        interactor?.getProductsCoreData()
    }
    
    func saveProductsCoreData(data: ProductRegister) {
        interactor?.saveProductCoreData(data: data)
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
    func onRecivedCategoryCoreData(data: [NSManagedObject]) {
        view?.recivedCategoryfromCoreData(data: data)
    }
    func resetDataInCD() {
        view?.resetDataInCoreData()
    }
    func onRecivedProductsCoreData(data: [NSManagedObject]) {
        view?.recivedProductsFromCoreData(data: data)
    }
}
