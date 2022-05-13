//
//  DetailProductIteractor.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit
import CoreData

class DetailProductInteractor: NSObject, DetailProductInteractorProtocol{

    var output: DetailProductOutputProtocol?
    
    func savedCompraUser(compra: ComprasUser){
        InternalDataCompras().saveCompraInCoreData(data: compra, delegate: self)
    }
    func deleteProducts(id: Int) {
        RequestManager.generic(url: "\(ExternalData().editProduct)\(id)", metodo: "DELETE", delegate: self)
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
extension DetailProductInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        print("borre")
        output?.deleteSuccessProd()
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("fallo")
    }
}
