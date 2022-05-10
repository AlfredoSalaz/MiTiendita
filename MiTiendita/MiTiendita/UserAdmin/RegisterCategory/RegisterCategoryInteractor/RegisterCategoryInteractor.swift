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
        RequestManager.generic(url: ExternalData().urlAddCategory, metodo: "POST", contenido: data, tipoDato: CategoryProduct.self, delegate: self, tag: 0)
        
    }
    
    func editeddCategory(data: [String : Any], id: Int) {
        RequestManager.generic(url: "\(ExternalData().urlEditCategory)\(id)", metodo: "PUT",contenido: data, tipoDato: CategoryProduct.self, delegate: self, tag: 2)
    }
    
    func savedImage(type: String, nameFile: String, image: UIImage) {
        //guard let imagen = image else {return}
        RequestManager().subirImagen(nombreParametro: type, nombreArchivo: "\(nameFile).jpg", imagen: image, delegate: self, tag: 1)
    }
    func savedInCoreData(data: CategoryRegister){
        InternalData().saveCategoryInCoreData(data: data, delegate: self)
    }
    func editedInCoreData(data: CategoryRegister, objectCoreData: NSManagedObject) {
        InternalData().updateCategoryInCoreData(data: data, delegate: self, object: objectCoreData)
    }
    
}
extension RegisterCategoryInteractor: RequestManagerDelegate{
    func onResponseSuccess(data: Decodable?, tag: Int) {
        switch tag {
        case 0:
            if let data = data as? CategoryProduct{
                output?.onRecivedMesageSuccesfulCategory(data: data)
            }
        case 1:
            if let data = data as? RespuestaSubirImagen {
                output?.onRecivedUrlImage(url: data.location)
            }
        case 2:
            if let datas = data as? CategoryProduct {
                output?.onRecivedMesageSuccesfulCategory(data: datas)
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
        print("se guardo Categoria")
    }
    func saveCategoryFaillure(error: NSError) {
        print("no se guardo")
    }
}
