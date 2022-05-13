//
//  ListaTarjetasInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import CoreData

class ListaTarjetasInteractor: NSObject, ListaTarjetasInteractorProtocol {
    var output: ListaTarjetasInteractorOutputProtocol?
    
    func loadCardsData() {
        InternalDataRegisterTarjeta().getTarjetaCoreDataa(delegate: self)
    }
    
}

extension ListaTarjetasInteractor: InternalDataRegisterTarjetaDelegate{
    func recivedSucessTarjeta(data: [NSManagedObject]) {
        print("se recupero la info \(data.count)")
        output?.onRecivedListCards(data: data)
    }
    func faillureRequest(error: NSError) {
        print("fallo al obtener la lista")
    }
}
