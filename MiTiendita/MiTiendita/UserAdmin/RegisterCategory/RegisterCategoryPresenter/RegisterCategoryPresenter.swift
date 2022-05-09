//
//  RegisterCategoryPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

class RegisterCategoryPresenter: NSObject, RegisterCategoryPresenterProtocol{
    var categoryPre: CategoryProduct?
    var isEditPre: Bool?
    
    var view: RegisterCategoryViewControllerProtocol?
    var interactor: RegisterCategoryInteractorProtocol?
    var router: RegisterCategoryRouterProtocol?
    
    func saveCategory(data: [String: Any] ) {
        interactor?.savedCategory(data: data)
    }
    func saveImage(type: String, nameFile: String, image: UIImage) {
        interactor?.savedImage(type: type, nameFile: nameFile, image: image)
    }
    func edittCategory(data: [String : Any], id: Int) {
        interactor?.editeddCategory(data: data, id: id)
    }
    func saveInCoreData(data: CategoryRegister){
        interactor?.savedInCoreData(data: data)
    }
    func recivedCategoryEdit() {
        view?.isEdit = isEditPre
        view?.category = categoryPre
    }
}

extension RegisterCategoryPresenter: RegisterCategoryInteractorOutputProtocol{
    func onRecivedUrlImage(url: String){
        view?.recivedUrl(url: url)
    }
    func onRecivedMesageSuccesfulCategory(data: CategoryProduct){
        view?.savedCategory(data: data)
    }
    func onRecivedMessageFaillure(){
        
    }
}
