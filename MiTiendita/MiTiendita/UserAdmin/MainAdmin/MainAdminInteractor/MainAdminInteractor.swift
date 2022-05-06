//
//  MainAdminInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//
import CoreData
import UIKit

class MainAdminInteractor: NSObject, MainAdminInteractorProtocol {
    var output: MainAdminInteractorOutputProtocol?
    
    func getCategoriesProduct(){
        RequestManager.generic(url: ExternalData().categoriesProduct, metodo: "GET", tipoResultado: [CategoryProduct].self, delegate: self, tag: 0)
    }
    func getProducts(){
        print("Antes del request")
        RequestManager.generic(url: ExternalData().listProduct, metodo: "GET", tipoResultado: [Product].self, delegate: self, tag: 1)
    }
    func getCategoryCoreData() {
        InternalData().getCategoryCoreData(delegate: self)
    }
    func resetDataEntityCoreData(name: String) {
        InternalData().resetAllRecords(in: name, delegate: self)
    }
    func saveCategoryCoreData(data: CategoryRegister) {
        InternalData().saveCategoryInCoreData(data: data, delegate: self)
    }
}
extension MainAdminInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        switch tag {
        case 0:
            if let dato = data as? [CategoryProduct] {
                output?.onRecivedCategory(data: dato)
            }
        case 1:
            if let dato = data as? [Product] {
                output?.onRecibiProducto(data: dato)
            }
        default:
            output?.onRecivedFaillureData()
        }
        
    }
    func requestFaillure(error: CodeResponse, tag: Int) {
        print("Faillure..")
        output?.onRecivedFaillureData()
    }
}

extension MainAdminInteractor: InternalDataDelegate{
    func onRecivedCategorySuccess(data: [NSManagedObject]) {
        output?.onRecivedCategoryCoreData(data: data)
    }
    func resetSuccess() {
        output?.resetDataInCD()
    }
    func saveCategorySuccess(data: NSManagedObject) {
        print("Guarde la info")
    }
    func requestFaillure(error: NSError) {
        print("fallo")
        output?.onRecivedFaillureData()
    }
}
