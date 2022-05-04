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
    var user: User?
    var isEditiing: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validateData()
        txtNombre.layer.borderWidth = 1
        txtNombre.layer.borderColor = UIColor.magenta.cgColor
        txtApellido.layer.borderWidth = 1
        txtApellido.layer.borderColor = UIColor.magenta.cgColor
        txtCorreo.layer.borderWidth = 1
        txtCorreo.layer.borderColor = UIColor.magenta.cgColor
        txtPassword.layer.borderWidth = 1
        txtPassword.layer.borderColor = UIColor.magenta.cgColor
        txtDireccion.layer.borderWidth = 1
        txtDireccion.layer.borderColor = UIColor.magenta.cgColor
        txtTarjetaCredito.layer.borderWidth = 1
        txtTarjetaCredito.layer.borderColor = UIColor.magenta.cgColor
    }

    func validateData(){
        guard let isEditiing = isEditiing else {return}
        if isEditiing {
            guard let user = self.user else {return}
            txtNombre.text = user.name
            txtCorreo.text = user.email
        }
    }
    @IBAction func btnGuardarDatos(_ sender: Any) {
        
    }
    @IBAction func btnBack(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}
