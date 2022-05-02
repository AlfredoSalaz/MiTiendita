//
//  PerfilUserRegisterViewController.swift
//  MiTiendita
//
//  Created by user215494 on 4/27/22.
//

import UIKit

class PerfilUserRegisterViewController: UIViewController, PerfilUserRegisterViewControllerProtocol {
    
    
    @IBOutlet weak var imgUserPerfil: UIImageView!
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtTarjetaCredito: UITextField!
    
    var presenter: PerfilUserRegisterPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnGuardarDatos(_ sender: Any) {
        
    }
}
