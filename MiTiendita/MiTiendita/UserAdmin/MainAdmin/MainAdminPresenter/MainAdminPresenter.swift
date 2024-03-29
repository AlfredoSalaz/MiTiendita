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
    func openDetailProduct(){
        router?.openDetailProduct(view: view!)
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
    func openViewComprasRouterfromMainPre() {
        router?.openViewComprasRouterfromMain(view: view!)
    }
    func openListTarjeta() {
        router?.openListTarjeta(view: view!)
    }
    func openListHistoryComprass() {
        router?.openListHistoryCompras(view: view!)
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
