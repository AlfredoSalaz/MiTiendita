//
//  MainUserRegisterInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

class MainUserRegisterInteractor: NSObject, MainUserRegisterInteractorProtocol {
    
    var users: [NSManagedObject]?
    var manageContext: NSManagedObjectContext!
    let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    
    var output: MainUserRegisterOutputProtocol?
    
    func getUsuarios() {
        
        print("valorrrrrrrr")
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest <UsuariosCD> = UsuariosCD.fetchRequest()
        
        do{
            let resultados = try manageContext.fetch(fetchRequest)
            
            users = resultados as [NSManagedObject]
            
            for res in resultados{
                
                print("Datos------\(res.nombre)")
                print(res.apellido)
            }
            output?.datosObtenidosUser(data: resultados)
            
        }catch(let error as NSError){
            print(error)
        }
        
    }
    
}
