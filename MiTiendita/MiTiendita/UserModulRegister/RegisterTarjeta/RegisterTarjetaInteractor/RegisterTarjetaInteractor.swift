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
        print("tarjeta \(data?.banco) ")
        InternalDataRegisterTarjeta().saveTarjetaInCoreData(data: data, delegate: self)
    }
    
    func updateTrajetas() {
        
    }
    
    func deleteTarjetas() {
        
    }
    
    func getTarjeta() {
        
    }
    
}
extension RegisterTarjetaInteractor: InternalDataRegisterTarjetaDelegate{
    func saveTarjetaSuccess(data: NSManagedObject?) {
        //print("data\(data?.value(forKey: "usuario"))")
        //print("\(data.)")
        output?.savedTarjetaInCD()
    }
}
