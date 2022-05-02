//
//  UserRegisterProductsViewController.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit

//1.- Creación de carpetas
//2.- Crear las clases de cada una
//3.-Creacion de los protocolos
//4.- Extendemos en las clases de los protocolos creados
//5.- Creamos el modúlo que se iniciara desde nuestra vista

class UserRegisterProductsViewController: UIViewController,  UserRegisterProductsViewControllerProtocol {
    
    var presenter: UserRegisterProductsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
