//
//  DetailProductIteractor.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit
import CoreData

class DetailProductInteractor: NSObject, DetailProductInteractorProtocol, RequestManagerDelegate{

    var output: DetailProductOutputProtocol?
    
    func savedCompraUser(compra: ComprasUser){
        InternalDataCompras().saveCompraInCoreData(data: compra, delegate: self)
    }
}
extension DetailProductInteractor: InternalDataComprasDelegate{
    func saveCompraSuccess(data: NSManagedObject?) {
        print("se guardo \(data?.value(forKey: "productId"))")
        output?.savedCompraCD()
    }
    func faillureRequest(error: NSError) {
        print("fallo al guardar \(error)")
    }
}
