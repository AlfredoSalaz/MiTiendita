//
//  HistoryComprasInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import CoreData

class HistoryComprasInteractor: NSObject, HistoryComprasInteractorProtocol{
    var output: HistoryComprasInteractorOutputProtocol?
    
    func getListaHistory() {
        InternalDataCompras().getComprasCoreDataa(delegate: self)
    }
}

extension HistoryComprasInteractor: InternalDataComprasDelegate{
    func recivedSucessCompra(data: [NSManagedObject]) {
        print("succ")
        output?.successGetHistory(data: data)
    }
    func faillureRequest(error: NSError) {
        print("fallo")
    }
}
