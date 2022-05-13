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
    func openViewCompras() {
        router?.openViewComprasRouter(view: view!)
    }
    func saveCompraUser(compra: ComprasUser){
        interactor?.savedCompraUser(compra: compra)
    }
    func openEditProducts(isEdit: Bool?) {
        router?.openEditProduct(view: view!, isEdit: isEdit)
    }
    func deleteProduct(id: Int) {
        interactor?.deleteProducts(id: id)
    }
}
extension DetailProductPresenter: DetailProductOutputProtocol{
    func savedCompraCD(){
        view?.saveCompraCoreData()
    }
    func deleteSuccessProd() {
        view?.deleteSuccessProduct()
    }
}
