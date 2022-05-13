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
    }
    func getTarjetaCoreDataa( delegate: InternalDataRegisterTarjetaDelegate) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appdelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest <TarjetaCD> = TarjetaCD.fetchRequest()
        do{
            let resultado = try managedContext.fetch(fetchRequest)
            let data = resultado as [NSManagedObject]
            delegate.recivedSucessTarjeta(data: data)
        }catch(let error as NSError){
            delegate.faillureRequest(error: error)
        }
    }
    
    func deleteTarjetaCoreData(data: NSManagedObject, delegate: InternalDataRegisterTarjetaDelegate){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appdelegate.persistentContainer.viewContext
        
        manageContext.delete(data)
        do{
            try manageContext.save()
            delegate.saveTarjetaSuccess(data: data)
        }catch (let error as NSError){
            delegate.faillureRequest(error: error)
        }
    }
    func updateTarjetaCoreData(object: NSManagedObject, delegate: InternalDataRegisterTarjetaDelegate, data: TarjetaModel?){
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appdelegate.persistentContainer.viewContext
        do {
            object.setValue(data?.banco, forKey: "banco")
            object.setValue(data?.cv, forKey: "cv")
            object.setValue(data?.nombre, forKey: "nombre")
            object.setValue(data?.numero, forKey: "numero")
            object.setValue(data?.saldo, forKey: "saldo")
            object.setValue(data?.userId, forKey: "userId")
            object.setValue(data?.vencimiento, forKey: "vencimiento")
            
            try manageContext.save()
            delegate.saveTarjetaSuccess(data: object)
        } catch (let error as NSError) {
            print("Failed")
            delegate.faillureRequest(error: error)
        }
    }
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
