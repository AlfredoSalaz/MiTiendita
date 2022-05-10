//
//  UserViewController.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import UIKit

class UserViewController: UIViewController, UserViewControllerProtocol {
    
    @IBOutlet weak var txtNombre: UITextField!
    
    @IBOutlet weak var txtApellido: UITextField!

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblTextoCampos: UILabel!
    
    var presenter: UserPresenterProtocol?
    var user: [String: Any]?
    
    let myColor : UIColor = UIColor.magenta

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNombre?.layer.borderWidth = 2
        txtApellido?.layer.borderWidth = 2
        txtEmail?.layer.borderWidth = 2
        txtPassword?.layer.borderWidth = 2
        
        txtNombre?.layer.borderColor = myColor.cgColor
        txtApellido?.layer.borderColor = myColor.cgColor
        txtEmail?.layer.borderColor = myColor.cgColor
        txtPassword.layer.borderColor = myColor.cgColor
        
    }
    //Validar 4 caracteres
    func validarCampos() {
        guard let email = txtEmail?.text, let password = txtPassword?.text else{
            showAlert()
            return
        }
        
        if password.count < 4 || !email.isEmail || email == ""
                              || password == "" || txtNombre.text == ""
                              || txtApellido.text == "" {
            let alert = UIAlertController(title: "Error al registrar", message: "*Correo electronico invalido\n*La contraseña debe ser mayor a 4 caracteres", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if password.count >= 5{
            print("Puede ingresar")
        }
    }
    
    func dismissWindow() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    @IBAction func btnRegistrar(_ sender: Any) {
        
        loadDataUser()
        presenter?.saveUserApi(user: user!)
        
        //validarCampos()
    }
    
    func loadDataUser(){
        let nombre = txtNombre.text ?? ""
        let apellido = txtApellido.text ?? ""
        let correo = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        user = [
            "name": nombre + " " + apellido,
            "email": correo,
            "password": password,
            "avatar": "https://api.lorem.space/image/face?w=640&h=480"
        ]
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
        
    }
    
    func showAlert(){
        // create the alert
        let alert = UIAlertController(title: "Error al registrar", message: "Los campos no deben ir vacios.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}
