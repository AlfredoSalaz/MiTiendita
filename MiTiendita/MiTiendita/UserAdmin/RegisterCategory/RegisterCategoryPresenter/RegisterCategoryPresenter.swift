//
//  RegisterCategoryPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

class RegisterCategoryPresenter: NSObject, RegisterCategoryPresenterProtocol{
    var view: RegisterCategoryViewControllerProtocol?
    var interactor: RegisterCategoryInteractorProtocol?
    var router: RegisterCategoryRouterProtocol?
    
    func saveCategory(data: [String: Any] ) {
        interactor?.savedCategory(data: data)
    }
    func saveImage(type: String, nameFile: String, image: UIImage) {
        interactor?.savedImage(type: type, nameFile: nameFile, image: image)
    }
    func saveInCoreData(data: CategoryRegister){
        interactor?.savedInCoreData(data: data)
    }
}

extension RegisterCategoryPresenter: RegisterCategoryInteractorOutputProtocol{
    func onRecivedUrlImage(url: String){
        view?.recivedUrl(url: url)
    }
    func onRecivedMesageSuccesfulCategory(){
        view?.savedCategory()
    }
    func onRecivedMessageFaillure(){
        
    }
}
