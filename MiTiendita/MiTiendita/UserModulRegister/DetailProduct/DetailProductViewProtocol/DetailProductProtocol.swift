//
//  DetailProductProtocol.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

//View
protocol DetailProductViewControllerProtocol: UIViewController {
    var presenter: DetailProductPresenterProtocol? {get set}
    
    var product: ProductDetail? {get set}

}

//Interactor
protocol DetailProductInteractorProtocol: NSObject {
    var output: DetailProductOutputProtocol? {get set}

}

//Presenter
protocol DetailProductPresenterProtocol: NSObject {
    var view: DetailProductViewControllerProtocol? {get set}
    var interactor: DetailProductInteractorProtocol? {get set}
    var router: DetailProductRouterProtocol? {get set}
    var product: ProductDetail? {get set}
    func recivedProductFromListProduct()
}

//Output
protocol DetailProductOutputProtocol: NSObject {
    
}

//Router
protocol DetailProductRouterProtocol{
    
    static func createModule(data: ProductDetail) -> UIViewController
    
}



