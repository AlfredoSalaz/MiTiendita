//
//  ListaTarjetasPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import CoreData

class ListaTarjetasPresenter: NSObject, ListaTarjetasPresenterProtocol{
    var view: ListaTarjetasViewControllerProtocol?
    
    var interactor: ListaTarjetasInteractorProtocol?
    
    var router: ListaTarjetasRouterProtocol?
    func loadCards() {
        interactor?.loadCardsData()
    }
    
}
extension ListaTarjetasPresenter: ListaTarjetasInteractorOutputProtocol{
    func onRecivedListCards(data: [NSManagedObject]) {
        view?.onReciveListCards(data: data)
    }
}
