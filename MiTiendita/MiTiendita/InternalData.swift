//
//  InternalData.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 05/05/22.
//

import UIKit
import CoreData

class InternalData {
    
    func saveCategoryInCoreData(data: CategoryRegister, delegate: InternalDataDelegate){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Categories", in: manageContext) else {
            print("No se encontro la entidad")
            return
        }
        let category = NSManagedObject(entity: entity, insertInto: manageContext)
        category.setValue(data.id, forKey: "id")
        category.setValue(data.name, forKey: "name")
        category.setValue(getImageDataFromUrl(url: data.image), forKey: "image")
        do {
            try manageContext.save()
            delegate.saveCategorySuccess(data: category)
        }catch (let error as NSError) {
            delegate.requestFaillure(error: error)
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
    func getCategoryCoreData( delegate: InternalDataDelegate) {
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appdelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest <Categories> = Categories.fetchRequest()
        do{
            let resultado = try managedContext.fetch(fetchRequest)
            let data = resultado as [NSManagedObject]
            print("dataAAAAAA: \(data.count)")
            delegate.onRecivedCategorySuccess(data: data)
        }catch(let error as NSError){
            delegate.requestFaillure(error: error)
        }
    }
    
    func resetAllRecords(in entity : String, delegate: InternalDataDelegate) // entity = Your_Entity_Name
            {
                let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
                let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
                let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
                do{
                    try context.execute(deleteRequest)
                    try context.save()
                    delegate.resetSuccess()
                }
                catch(let error as NSError)
                {
                    delegate.requestFaillure(error: error)
                }
            }
}

protocol InternalDataDelegate {
    func saveCategorySuccess(data: NSManagedObject)
    func onRecivedCategorySuccess(data: [NSManagedObject])
    func requestFaillure(error: NSError)
    func resetSuccess()
}

extension InternalDataDelegate{
    func saveCategorySuccess(data: NSManagedObject){
        
    }
    func onRecivedCategorySuccess(data: [NSManagedObject]){
        
    }
    func requestFaillure(error: NSError){
        
    }
    func resetSuccess(){
        
    }
}
