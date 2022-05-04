//
//  DetailProductPresenter.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

class DetailProductPresenter: NSObject, DetailProductPresenterProtocol {
    
    var view: DetailProductViewControllerProtocol?
    
    var interactor: DetailProductInteractorProtocol?
    
    var router: DetailProductRouterProtocol?

}
extension DetailProductPresenter: DetailProductOutputProtocol{
    
}
