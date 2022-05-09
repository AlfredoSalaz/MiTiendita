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
        InternalDataUser().getUsuarios(delegate: self)
    }
    
}


extension MainUserRegisterInteractor: InternalDataUserDelegate {
    func getUser(data: [NSManagedObject]) {
        output?.datosObtenidosUser(data: data)
    }
}
