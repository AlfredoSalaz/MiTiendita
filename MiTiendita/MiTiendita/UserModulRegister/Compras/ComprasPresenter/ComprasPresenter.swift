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
    var user: User?
    var product: ProductDetail?
    
    func recivedData(){
        view?.user = user
        view?.product = product
    }
    func getComprasCD(){
        interactor?.getComprasCoreData()
    }
}
extension ComprasPresenter: ComprasInteractorOutputProtocol{
    func recivedCompraFromCD(data: [NSManagedObject]){
        view?.recivedCompraFromCoreData(data: data)
    }
}
