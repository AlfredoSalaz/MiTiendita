//
//  ComprasPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import CoreData

class ComprasPresenter: NSObject, ComprasPresenterProtocol{
    var view: ComprasViewControllerProtocol?
    var interactor: ComprasInteractorProtocol?
    var router: ComprasRouterProtocol?
    var product: ProductDetail?
    
    func recivedData(){
        view?.product = product
    }
    func getComprasCD(){
        interactor?.getComprasCoreData()
    }
    func updateCompraUserCar(compra: ComprasUser, object: NSManagedObject?) {
        interactor?.updateCompraUserCarr(compra: compra, object: object)
    }
    
    func deleteCompraUser(object: NSManagedObject?) {
        interactor?.deleteCompraUserCD(object: object)
    }
    
}
extension ComprasPresenter: ComprasInteractorOutputProtocol{
    func recivedCompraFromCD(data: [NSManagedObject]){
        view?.recivedCompraFromCoreData(data: data)
    }
    func deletedObjectSuccess() {
        view?.deletedObjectSuccessInCD()
    }
}
