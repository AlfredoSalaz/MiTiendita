//
//  IndexPresenter.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexPresenter: NSObject, IndexPresenterProtocol{
    
    var router: IndexRouterProtocol?
    var interactor: IndexInteractorProtocol?
    var view: IndexViewControllerProtocol?
    
    func openMainTienda(user: User) {
        router?.openMainTiendaRouter(view: view!, user: user)
    }
    func openViewRegister(){
        router?.openViewRegisters(view: view!)
    }
    func authenticationUser(data: [String : Any]) {
        interactor?.authenticatioUser(data: data)
    }
    
    func getUserAuthentication(token: String) {
        interactor?.getUserAuthenticatio(token: token)
    }
    
    func openViewRegisterNewUser() {
        router?.openViewregisterNewUser(view: view!)
    }
    func getAllUserOfApi() {
        interactor?.getAllUserOfApi()
    }
    
}

extension IndexPresenter: IndexInteractorOutputProtocol{
    
    func onRecivedToken(data: UserToken) {
        view?.recivedToken(token: data)
    }
    
    func onRecivedUser(data: User) {
        view?.recivedUser(data: data)
    }
    
    func onResponseFaillure(error: NSError) {
        print("estoy en presenter y fallo")
    }
    func faillureAuthPre() {
        view?.faillureAuthView()
    }
    
    func receivedAllOfUsers(data: [User]) {
        view?.receivedAllOfUsers(data: data)
    }
    
}
