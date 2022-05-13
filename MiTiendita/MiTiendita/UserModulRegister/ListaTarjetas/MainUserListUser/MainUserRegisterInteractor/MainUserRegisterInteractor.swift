//
//  MainUserRegisterInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 04/05/22.
//

import UIKit
import CoreData

class MainUserRegisterInteractor: NSObject, MainUserRegisterInteractorProtocol, RequestManagerDelegate {

    var users: [NSManagedObject]?
    var manageContext: NSManagedObjectContext!
    let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    
    var output: MainUserRegisterOutputProtocol?
    
    func getUsuarios() {
        //InternalDataUser().getUsuarios(delegate: self)
        print("Consultando a la api")
        RequestManager.generic(url: ExternalData().getAllUser, metodo: "GET", tipoResultado: [User].self, delegate: self, tag: 0)
    }
}

extension MainUserRegisterInteractor: InternalDataUserDelegate {
    
    func onResponseSuccess(data: Decodable?, tag: Int) {
        if let datos = data as? [User]{
            print("Si se pudo guardar")
            output?.datosObtenidosUser(data: datos)
        }
    }
    
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Fallo")
    }
}
