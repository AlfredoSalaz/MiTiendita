//
//  RegisterTarjetaInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit
import CoreData

class RegisterTarjetaInteractor: NSObject, RegisterTarjetaInteractorProtocol{
    var output: RegisterTarjetaInteractorOutputProtocol?
    
    func saveTarjetas(data: TarjetaModel?) {
        InternalDataRegisterTarjeta().saveTarjetaInCoreData(data: data, delegate: self)
    }
    
    func updateTrajetas(data: TarjetaModel?, object: NSManagedObject?) {
        InternalDataRegisterTarjeta().updateTarjetaCoreData(object: object!, delegate: self, data: data)
    }
    
    func deleteTarjetas(object: NSManagedObject?) {
        InternalDataRegisterTarjeta().deleteTarjetaCoreData(data: object!, delegate: self)
    }
    
    func getTarjeta() {
        
    }
    
}
extension RegisterTarjetaInteractor: InternalDataRegisterTarjetaDelegate{
    func saveTarjetaSuccess(data: NSManagedObject?) {
        print("save")
        output?.savedTarjetaInCD()
    }
}
