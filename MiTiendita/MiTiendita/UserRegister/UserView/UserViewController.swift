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
    @IBOutlet weak var stackEmail: UIStackView!
    @IBOutlet weak var stackPassword: UIStackView!
    
    var presenter: UserPresenterProtocol?
    var user1: [String: Any]?
    
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
        
        stackEmail.isHidden = true
        stackPassword.isHidden = true
    }
    
    func alert(){
        DispatchQueue.main.async {
            if self.txtNombre.text == "" || self.txtApellido.text == ""{
                if self.txtEmail.text == "" || self.txtPassword.text == ""{
                    self.showAlert()
                }
            }
        }
        
     }
    
    //Función que se encarga de validar el correo electronico y la longuitud de la contraseña del usuario
    func errorCheckEmail(user: ValidateEmail) {
        alert()
        if user.isAvailable == true { //NO existe, si te puedes loguear
            //presenter?.saveUserApi(user: user1!)
            print("Es true")
            DispatchQueue.main.async {
                if self.txtPassword.text!.count < 4{
                    self.stackPassword.isHidden = false
                }else {
                    self.stackPassword.isHidden = true
                    self.stackEmail.isHidden = true
                }
            }
            presenter?.saveUserApi(user: user1!)
            
    }else { //Usuario ya existente, no te puedes loguear
        DispatchQueue.main.async {
            self.stackEmail.isHidden = false
            if self.txtPassword.text!.count < 4{
                self.stackPassword.isHidden = false
            }else if user.isAvailable == true && self.txtPassword.text!.count > 5 {
                self.stackPassword.isHidden = true
                self.stackEmail.isHidden = true
                }
            }
        }
    }
    
    ///Función encargada de ocultar la pantalla, atraves del hilo principal
    func dismissWindow() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    ///Acción del boton registrar nuevo usuario
    @IBAction func btnRegistrar(_ sender: Any) {
        loadDataUser()
        presenter?.trySaveUserApi(user: user1!)
    }
    
    ///Función que asigna los valores  ingresados por el usuario, a un diccionario llamado usuario
    func loadDataUser(){
        let nombre = self.txtNombre.text ?? ""
        let apellido = self.txtApellido.text ?? ""
        let correo = self.txtEmail.text ?? ""
        let password = self.txtPassword.text ?? ""
        self.user1 = [
            "name": nombre + " " + apellido,
            "email": correo,
            "password": password,
            "avatar": "https://api.lorem.space/image/face?w=640&h=480"
        ]
    }
    
    ///Acción del botón regresar a la pantalla anterior
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    ///Funcion que muestra un alerta en pantalla, en dado caso que no cumpla con los parametros que se le pide al usuario
    func showAlert(){
        // create the alert
        let alert = UIAlertController(title: "Error al registrar", message: "Los campos no deben ir vacios.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

}

