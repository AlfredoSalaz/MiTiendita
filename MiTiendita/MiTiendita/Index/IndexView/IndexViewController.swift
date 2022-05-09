//
//  IndexViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexViewController: UIViewController, IndexViewControllerProtocol {
    var presenter: IndexPresenterProtocol?
    
    @IBOutlet weak var email: UITextField?
    @IBOutlet weak var password: UITextField?
    
    let myColor : UIColor = UIColor.magenta
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email?.layer.borderWidth = 2
        password?.layer.borderWidth = 2
        email?.layer.borderColor = myColor.cgColor
        password?.layer.borderColor = myColor.cgColor
        
    }
    private func validateUser(){
        guard let email = email?.text, let password = password?.text else{
            showAlert()
            return
        }
        if password.count < 4 || !email.isEmail || email == "" || password == "" {
            let alert = UIAlertController(title: "Error al registrar", message: "*Correo electronico invalido\n*La contraseña debe ser mayor a 4 caracteres", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func login(_ sender: Any){
        let data: [String: Any] = [
            "email": "\(email?.text ?? "")",
            "password": "\(password?.text ?? "")"
        ]
        presenter?.authenticationUser(data: data)
    }
    
    @IBAction func registerUser(_ sender: Any){
        presenter?.openViewRegister()
    }
    @IBAction func loginGuest(_ sender: Any){
        //presenter?.openMainTienda(tipeUser: "Admin")
    }

    func showAlert(){
        // create the alert
        let alert = UIAlertController(title: "Error al registrar", message: "Los campos no deben ir vacios.", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    func recivedToken(token: UserToken) {
        presenter?.getUserAuthentication(token: token.access_token ?? "")
    }
    
    
    func recivedUser(data: User) {
        presenter?.openMainTienda(user: data)
    }
}

extension String {
  var isEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
}
