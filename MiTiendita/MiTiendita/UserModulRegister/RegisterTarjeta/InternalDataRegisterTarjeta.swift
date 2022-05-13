//
//  InternalDataRegisterTarjeta.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import CoreData
import UIKit

class InternalDataRegisterTarjeta {
    func saveTarjetaInCoreData(data: TarjetaModel?, delegate: InternalDataRegisterTarjetaDelegate){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "TarjetaCD", in: manageContext) else {
            print("No se encontro la entidad")
            return
        }
        let tarjeta = NSManagedObject(entity: entity, insertInto: manageContext)
        tarjeta.setValue(data?.cv, forKey: "cv")
        tarjeta.setValue(data?.nombre, forKey: "nombre")
        tarjeta.setValue(data?.numero, forKey: "numero")
        tarjeta.setValue(data!.saldo, forKey: "saldo")
        tarjeta.setValue(data!.vencimiento, forKey: "vencimiento")
        tarjeta.setValue(data?.userId, forKey: "userId")
        tarjeta.setValue(data!.banco, forKey: "banco")
        do {
            try manageContext.save()
            delegate.saveTarjetaSuccess(data: tarjeta)
        }catch (let error as NSError) {
            delegate.faillureRequest(error: error)
        }
    }/*
    func getTarjetaCoreDataa( delegate: InternalDataComprasDelegate) {
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
    func getTarjetaDataFromUrl(url: String) -> Data{
        guard  let url = URL(string: url) else {
            return Data()
        }
        var dataImage = Data()
        if let data = try? Data(contentsOf: url){
            dataImage = data
        }
        return dataImage
    }
    func deleteTarjetaCoreData(data: NSManagedObject, delegate: InternalDataComprasDelegate){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appdelegate.persistentContainer.viewContext
        
        manageContext.delete(data)
        do{
            try manageContext.save()
            delegate.deleteCompraSuccess(data: data)
        }catch (let error as NSError){
            delegate.faillureRequest(error: error)
        }
    }
    func updateTarjetaCoreData(object: NSManagedObject, delegate: InternalDataComprasDelegate, data: ComprasUserCD){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appdelegate.persistentContainer.viewContext
        do {
            object.setValue(data.userId, forKey: "userId")
            object.setValue(data.productId, forKey: "productId")
            object.setValue(data.numberProduct, forKey: "numerProduct")
            object.setValue(data.priceProduct, forKey: "priceProduct")
            object.setValue(data.total, forKey: "total")
            object.setValue(data.totalProduct, forKey: "totalProduct")
            object.setValue(data.nameProduct, forKey: "nameProduct")
            object.setValue(data.imageProduct, forKey: "imageProduct")
            try manageContext.save()
            delegate.updatedCompraSuccess(data: object)
        } catch (let error as NSError) {
            print("Failed")
            delegate.faillureRequest(error: error)
        }
    }*/
}

protocol InternalDataRegisterTarjetaDelegate {
    func saveTarjetaSuccess(data: NSManagedObject?)
    func faillureRequest(error: NSError)
    func recivedSucessTarjeta(data: [NSManagedObject])
    func deleteTarjetaSuccess(data: NSManagedObject)
    func updatedTarjetaSuccess(data: NSManagedObject)
}

extension InternalDataRegisterTarjetaDelegate{
    func saveTarjetaSuccess(data: NSManagedObject?){
        
    }
    func faillureRequest(error: NSError){
        
    }
    func recivedSucessTarjeta(data: [NSManagedObject]){
        
    }
    func deleteTarjetaSuccess(data: NSManagedObject){
        
    }
    func updatedTarjetaSuccess(data: NSManagedObject){
        
    }
}
