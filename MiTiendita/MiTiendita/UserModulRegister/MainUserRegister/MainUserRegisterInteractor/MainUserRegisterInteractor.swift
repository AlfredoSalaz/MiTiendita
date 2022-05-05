//
//  MainUserRegisterInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

class MainUserRegisterInteractor: NSObject, MainUserRegisterInteractorProtocol {
    
    var users = [NSManagedObject]()
    var manageContext: NSManagedObjectContext!
    let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    
    var output: MainUserRegisterOutputProtocol?
    
    func getUsuarios() {
        
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest <Usuarios> = Usuarios.fetchRequest()
        do{
            let resultados = try manageContext.fetch(fetchRequest)
            
            users = resultados as [NSManagedObject]
            
            print(users)
            
            func onResponseSuccess(data: Decodable?, tag: Int) {
                
                if let dato = data as? [UsuarioCore] {
                    output?.datosObtenidosUser(data: dato)
                }
            }
            
        }catch(let error as NSError){
            print(error)
        }
        
    }
    
}
