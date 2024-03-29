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
        //InternalData().resetAllRecords(in: "ComprasCD", delegate: self)
    }
    func updateCompraUserCarr(compra: ComprasUserCD, object: NSManagedObject?) {
        print("mee")
        guard let object = object else{return}
        InternalDataCompras().updateCompraCoreData(object: object, delegate: self, data: compra)
    }
    
    func deleteCompraUserCD(object: NSManagedObject?) {
        guard let object = object else{return}
        InternalDataCompras().deleteComprasCoreData(data: object, delegate: self)
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
    func deleteCompraSuccess(data: NSManagedObject) {
        print("se ha borrado \(data)")
        output?.deletedObjectSuccess()
    }
    func updatedCompraSuccess(data: NSManagedObject) {
        print("success")
        output?.updatedSuccess()
    }
}

extension ComprasInteractor: InternalDataDelegate{
    func resetSuccess() {
        print("se borro")
    }
}
