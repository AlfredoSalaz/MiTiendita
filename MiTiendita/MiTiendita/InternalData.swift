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
        print("llego -----")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Categories", in: manageContext) else {
            print("No se encontro la entidad")
            return
        }
        print("Antes de Category----")
        let category = NSManagedObject(entity: entity, insertInto: manageContext)
        print("------sssss----")
        category.setValue(data.name, forKey: "name")
        category.setValue(getImageDataFromUrl(url: data.image), forKey: "image")
        do {
            try manageContext.save()
            print("--se guardo--")
            delegate.saveCategorySuccess(data: category)
        }catch (let error as NSError) {
            print("error al guardar: \(error)")
            delegate.saveCategoryFaillure(error: error)
        }
    }
    func getImageDataFromUrl(url: String) -> Data{
        guard  let url = URL(string: url) else {
            return Data()
        }
        var dataImage = Data()
        if let data = try? Data(contentsOf: url){
            dataImage = data
            print("Se inicializo bien")
        }
        return dataImage
    }
}

protocol InternalDataDelegate {
    func saveCategorySuccess(data: NSManagedObject)
    func saveCategoryFaillure(error: NSError)
}

extension InternalDataDelegate{
    func saveCategorySuccess(data: NSManagedObject){
        
    }
    func saveCategoryFaillure(error: NSError){
        
    }
}
