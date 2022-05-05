//
//  RegisterCategoryInteractor.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit
import CoreData
class RegisterCategoryInteractor: NSObject, RegisterCategoryInteractorProtocol {
    var output: RegisterCategoryInteractorOutputProtocol?
    
    
    
    func savedCategory(data: [String: Any] ) {
        RequestManager.generic(url: ExternalData().urlAddCategory, metodo: "POST", contenido: data, delegate: self, tag: 0)
        
    }
    func savedImage(type: String, nameFile: String, image: UIImage) {
        //guard let imagen = image else {return}
        RequestManager().subirImagen(nombreParametro: type, nombreArchivo: "\(nameFile).jpg", imagen: image, delegate: self, tag: 1)
    }
    func savedInCoreData(data: CategoryRegister){
        InternalData().saveCategoryInCoreData(data: data, delegate: self)
    }
    
}
extension RegisterCategoryInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        switch tag {
        case 0:
            output?.onRecivedMesageSuccesfulCategory()
        case 1:
            if let data = data as? RespuestaSubirImagen {
                output?.onRecivedUrlImage(url: data.location)
            }
        default:
            output?.onRecivedMessageFaillure()
        }
        
    }
    func onResponseFailure(error: CodeResponse, tag: Int) {
        print("Faullure")
    }
}

extension RegisterCategoryInteractor: InternalDataDelegate {
    func saveCategorySuccess(data: NSManagedObject) {
        print("se guardo")
    }
    func saveCategoryFaillure(error: NSError) {
        print("no se guardo")
    }
}
