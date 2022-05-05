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
    
    var users: [User]?
    let myColor : UIColor = UIColor.magenta
    var user: User?
    
    var role: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email?.layer.borderWidth = 2
        password?.layer.borderWidth = 2
        email?.layer.borderColor = myColor.cgColor
        password?.layer.borderColor = myColor.cgColor
        
        presenter?.getAllUser()
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
        if email.isEmail && password.count >= 5{
            users?.forEach{
                if email == $0.email && password == $0.password{
                    role = $0.role
                    let us = User(id: $0.id, email: $0.email, password: $0.password, name: $0.name, role: $0.role)
                    self.user = us
                }else {
                    print("No existe")
                }
            }
        }
    }
    
    @IBAction func login(_ sender: Any){
        validateUser()
        guard let user = self.user else {
            print("Usuario o contraseña invalido")
            return
        }
        presenter?.openMainTienda(user: user)
        print("Exitoso \(user.name)")
        self.role = nil
        
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
    func recivedAllUser(data: [User]) {
        self.users = data
    }
}

extension String {
  var isEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
}
