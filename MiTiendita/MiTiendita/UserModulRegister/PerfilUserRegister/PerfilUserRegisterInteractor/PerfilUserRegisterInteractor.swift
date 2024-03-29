//
//  PerfilUserRegisterInteractor.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit
import CoreData

class PerfilUserRegisterInteractor: NSObject, PerfilUserRegisterInteractorProtocol{

    var users = [NSManagedObject]()
    
    var manageContext: NSManagedObjectContext!
    let appDelegate =  UIApplication.shared.delegate as! AppDelegate
    
    var output: PerfilUserRegisterInteractorOutPutProtocol?
    
    func saveUserInfo(user: UsuarioCore) {
        
        print("LLegando al interactor")
        
        let manageContext = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "UsuariosCD", in: manageContext) else {return}
        
        let usuario = NSManagedObject(entity: entity, insertInto: manageContext)
        
        usuario.setValue(user.nombre, forKey: "nombre")
        usuario.setValue(user.apellido, forKey: "apellido")
        usuario.setValue(user.password, forKey: "password")
        usuario.setValue(user.correo, forKey: "correo")
        usuario.setValue(user.direccion, forKey: "direccion")
        usuario.setValue(user.tarjeta, forKey: "tarjeta")

        //direction.setValue(Double(textFieldLong.text!), forKey: "longitud")
        
        do{
            try manageContext.save()
            print("Estos son los datos de los usuarios: \(usuario)")
            self.users.append(usuario)
            output?.dismiss()
            
        }catch(let error as NSError){
            print(error)
        }
    }
    
    func getAllUserCore() {
        print("Consultando a core data ")
        InternalDataUser().getUsuarios(delegate: self)
    }
        
}

extension PerfilUserRegisterInteractor: InternalDataUserDelegate{
    func getUser(data: [NSManagedObject]) {
        print("estoy aca")
        output?.onRecivedUsers(data: data)
    }
    
}
