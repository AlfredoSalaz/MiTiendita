//
//  InternalDataCompras.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import CoreData
import UIKit

class InternalDataCompras {
    func saveCompraInCoreData(data: ComprasUser, delegate: InternalDataComprasDelegate){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "ComprasCD", in: manageContext) else {
            print("No se encontro la entidad")
            return
        }
        let compra = NSManagedObject(entity: entity, insertInto: manageContext)
        compra.setValue(data.userId, forKey: "userId")
        compra.setValue(data.productId, forKey: "productId")
        compra.setValue(data.numberProduct, forKey: "numerProduct")
        compra.setValue(data.priceProduct, forKey: "priceProduct")
        compra.setValue(data.total, forKey: "total")
        compra.setValue(data.totalProduct, forKey: "totalProduct")
        compra.setValue(data.nameProduct, forKey: "nameProduct")
        compra.setValue(getImageDataFromUrl(url: data.imageProduct), forKey: "imageProduct")
        do {
            try manageContext.save()
            delegate.saveCompraSuccess(data: compra)
        }catch (let error as NSError) {
            delegate.faillureRequest(error: error)
        }
    }
    func getComprasCoreDataa( delegate: InternalDataComprasDelegate) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appdelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest <ComprasCD> = ComprasCD.fetchRequest()
        do{
            let resultado = try managedContext.fetch(fetchRequest)
            let data = resultado as [NSManagedObject]
            delegate.recivedSucessCompra(data: data)
        }catch(let error as NSError){
            delegate.faillureRequest(error: error)
        }
    }
    func getImageDataFromUrl(url: String) -> Data{
        guard  let url = URL(string: url) else {
            return Data()
        }
        var dataImage = Data()
        if let data = try? Data(contentsOf: url){
            dataImage = data
        }
        return dataImage
    }
}

protocol InternalDataComprasDelegate {
    func saveCompraSuccess(data: NSManagedObject?)
    func faillureRequest(error: NSError)
    func recivedSucessCompra(data: [NSManagedObject])
}

extension InternalDataComprasDelegate{
    func saveCompraSuccess(data: NSManagedObject?){
        
    }
    func faillureRequest(error: NSError){
        
    }
    func recivedSucessCompra(data: [NSManagedObject]){
        
    }
}
