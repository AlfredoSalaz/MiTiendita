//
//  HistoryComprasPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import CoreData

class HistoryComprasPresenter: NSObject, HistoryComprasPresenterProtocol{
    var view: HistoryComprasViewControllerProtocol?
    var interactor: HistoryComprasInteractorProtocol?
    var router: HistoryComprasRouterProtocol?
    func getListHistory() {
        interactor?.getListaHistory()
    }
    
}
extension HistoryComprasPresenter:  HistoryComprasInteractorOutputProtocol{
    func successGetHistory(data: [NSManagedObject]) {
        view?.successGetHistoryCompra(data: data)
    }
}
