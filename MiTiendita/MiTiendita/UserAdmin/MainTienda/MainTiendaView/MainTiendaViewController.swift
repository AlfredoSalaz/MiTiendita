//
//  MainTiendaViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class MainTiendaViewController: UIViewController, MainTiendaViewControllerProtocol {
    var presenter: MainTiendaPresenterProtocol?
    var user: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("El usuario es \(user)")
    }
}
