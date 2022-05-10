//
//  ComprasInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import CoreData

class ComprasInteractor: NSObject, ComprasInteractorProtocol{
    var output: ComprasInteractorOutputProtocol?
    
    func getComprasCoreData(){
        InternalDataCompras().getComprasCoreDataa(delegate: self)
    }
}

extension ComprasInteractor: InternalDataComprasDelegate{
    func recivedSucessCompra(data: [NSManagedObject]) {
        print("recibi \(data.count)")
        output?.recivedCompraFromCD(data: data)
    }
    func faillureRequest(error: NSError) {
        print("error \(error)")
    }
}
