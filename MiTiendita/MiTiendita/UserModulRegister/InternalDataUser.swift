//
//  InternalDataUser.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 06/05/22.
//

import Foundation
import CoreData
import UIKit



protocol InternalDataUserDelegate{
    func getUser(data: [NSManagedObject])
    func respuestaSatisfactoria(dato: String)
    func respuestaFallida(dato: String)
}

extension InternalDataUserDelegate{
    func getUser(data: [NSManagedObject]){
        
    }
    func respuestaSatisfactoria(dato: String){
        
    }
    
    func respuestaFallida(dato: String){
        
    }
}

class InternalDataUser {
    
    func getUsuarios(delegate: InternalDataUserDelegate) {
        
        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest <UsuariosCD> = UsuariosCD.fetchRequest()
        
        do{
            
            let resultados = try manageContext.fetch(fetchRequest)
            print(resultados.count)
            for res in resultados{
                print("name \(res.value(forKey: "nombre"))")
            }
            
            delegate.getUser(data: resultados)
             
        }catch(let error as NSError){
            delegate.respuestaFallida(dato: error as! String)
            print(error)
        }
        
    }
    
}
