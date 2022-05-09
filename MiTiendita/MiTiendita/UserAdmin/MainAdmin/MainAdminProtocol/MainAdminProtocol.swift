//
//  MainAdminProtocol.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//
import CoreData
import UIKit
//VIEW
protocol MainAdminViewControllerProtocol: UIViewController{
    var presenter: MainAdminPresenterProtocol? {get set}
    func onReceivedCategoryProduct(data: [CategoryProduct])
    func onReceivedlistProduct(data: [Product])
    func faillureData()
    func recivedDataFromPresenter(data: User)
    //CoreData
    func recivedCategoryfromCoreData(data: [NSManagedObject])
    func resetDataInCoreData()
    func recivedProductsFromCoreData(data: [NSManagedObject])
}
//pRESNTER
protocol MainAdminPresenterProtocol: NSObject{
    var view: MainAdminViewControllerProtocol? {get set}
    var interactor: MainAdminInteractorProtocol? {get set}
    var router: MainAdminRouterProtocol? {get set}
    //func openEditUser(user: User, isEdditing: Bool)
    func openRegisterCategory()
    func editCategory(data: CategoryProduct, isEdit: Bool)
    func openListProduct()
    func getCategories()
    func getProduct()
    func openViewUser()
    func openDetailProduct(data: ProductDetail)
    var recivedUser: User? {get set}
    func recivedDataFromIndex()
    //Coredata
    func saveCategoryInCoreData(data: CategoryRegister)
    func getCategoryCoreD()
    func resetEntityCoreData(name: String)
    func getProductCoreData()
    func saveProductsCoreData(data: ProductRegister)
}
//INTERACTOR
protocol MainAdminInteractorProtocol: NSObject {
    var output: MainAdminInteractorOutputProtocol? {get set}
    func getCategoriesProduct()
    func getProducts()
    //Coredata
    func getCategoryCoreData()
    func resetDataEntityCoreData(name: String)
    func saveCategoryCoreData(data: CategoryRegister)
    func getProductsCoreData()
    func saveProductCoreData(data: ProductRegister)
}
//OUTPUT INTERACTOR - PRESENTER
protocol MainAdminInteractorOutputProtocol: NSObject {
    func onRecivedCategory(data: [CategoryProduct])
    func onRecibiProducto(data: [Product])
    func onRecivedFaillureData()
    //Coredata
    func onRecivedCategoryCoreData(data: [NSManagedObject])
    func resetDataInCD()
    func onRecivedProductsCoreData(data: [NSManagedObject])
}
//ROUTER
protocol MainAdminRouterProtocol {
    func openRegisterCategoryRouter(view: MainAdminViewControllerProtocol)
    func editCategoryRouter(view: MainAdminViewControllerProtocol, data: CategoryProduct, isEdit: Bool)
    func openListProduct(view: MainAdminViewControllerProtocol)
    func openDetailProduct(view:MainAdminViewControllerProtocol, data: ProductDetail)
    static func createModuleMainAdmin(user: User) -> UIViewController
    func openListUsuers(View: MainAdminViewControllerProtocol)
}
