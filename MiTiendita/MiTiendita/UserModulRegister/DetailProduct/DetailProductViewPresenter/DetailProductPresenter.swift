//
//  DetailProductPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

class DetailProductPresenter: NSObject, DetailProductPresenterProtocol {
    var view: DetailProductViewControllerProtocol?
    var interactor: DetailProductInteractorProtocol?
    var router: DetailProductRouterProtocol?
    var product: ProductDetail?
    func recivedProductFromListProduct(){
        view?.product = product
    }
    func openViewCompras(product: ProductDetail?) {
        router?.openViewComprasRouter(product: product, view: view!)
    }
    func saveCompraUser(compra: ComprasUser){
        interactor?.savedCompraUser(compra: compra)
    }
}
extension DetailProductPresenter: DetailProductOutputProtocol{
    func savedCompraCD(){
        view?.saveCompraCoreData()
    }
}
