//
//  IndexViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import UIKit

class IndexViewController: UIViewController, IndexViewControllerProtocol {
    
    var presenter: IndexPresenterProtocol?
    var user: User?
    
    @IBOutlet weak var email: UITextField?
    @IBOutlet weak var password: UITextField?
    
    let myColor : UIColor = UIColor.magenta
    
    var listUsers: [User]?
    var mail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email?.layer.borderWidth = 2
        password?.layer.borderWidth = 2
        email?.layer.borderColor = myColor.cgColor
        password?.layer.borderColor = myColor.cgColor
        
    }
    
    func receivedAllOfUsers(data: [User]) {
        //listUsers = data
        print("Datos obtenidos: \(data.count)")
        var isEncontrado: Bool = false
        for user in data {
            if mail == user.email  {
                print("La contra es \(user.password)")
                DispatchQueue.main.async {
                    print("Entro 1")
                    let alert = UIAlertController(title: "Resultados", message: "Su contraseña es la siguiente: \n \((user.password)!)", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    isEncontrado = true
                }
            }
        }
        if !isEncontrado {
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Sin resultados", message: "El correo electronico no esta registrado, intente con otro correo", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    ///Se valida la longitud del password y que el correo sea correo antes de enviar a autenticacion
    private func validateUser(){
        guard let email = email?.text, let password = password?.text else{
            showAlert()
            return
        }
        if password.count < 4 || !email.isEmail || email == "" || password == "" {
            let alert = UIAlertController(title: "Error al registrar", message: "*Correo electronico invalido\n*La contraseña debe ser mayor a 4 caracteres", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let data: [String: Any] = [
                "email": "\(email)",
                "password": "\(password)"
            ]
            presenter?.authenticationUser(data: data)
        }
    }
    ///accion del boton Iniciar
    @IBAction func login(_ sender: Any){
        validateUser()
    }
    ///Accion del boton registrar usuario
    @IBAction func registerUser(_ sender: Any){
        presenter?.openViewRegister()
    }
    @IBAction func loginGuest(_ sender: Any){
        //presenter?.openMainTienda(tipeUser: "Admin")
        //presenter?.openViewRegisterNewUser()
    }
    
    @IBAction func btnGetPassword(_ sender: Any) {
        
        let alert = UIAlertController(title: "Restablecer contraseña", message: "Ingrese su correo electronico para restablecerla", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Restablecer", style: .default, handler: { (action:UIAlertAction) -> Void in
            //Guardamos el texto del texField en el array y  recargamos la tabla
            self.mail = alert.textFields?[0].text
            
            self.presenter?.getAllUserOfApi()
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive) { (action:UIAlertAction) -> Void in
        }
        //Añadimos el textField al UIAlertController
        alert.addTextField{
            (textField: UITextField) -> Void in
        }
        //Añadimos los dos UIAlertAction al UIAlertController
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        //Lanzamos el UIAlertController
        present(alert, animated: true, completion: nil)
        
        
    }
    
    ///Funcion que crea y presenta un alerta para cuando el usuario quiere iniciar sesion sin ingresar datos
    func showAlert(){
        let alert = UIAlertController(title: "Error al registrar", message: "Los campos no deben ir vacios.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    ///Funcion que recibe el token de autenticacion para el usuario registrado
    /// - Parameter token: Objeto que recibe la propiedad token_access
    func recivedToken(token: UserToken) {
        presenter?.getUserAuthentication(token: token.access_token ?? "")
    }
    ///Funcion que recibe el perfil del usuario autenticado
    /// - Parameter data: Objeto que recibe las propiedades del usuario
    func recivedUser(data: User) {
        presenter?.openMainTienda(user: data)
    }
    ///Funcion que se ejecuta cuando fallo la autenticacion
    func faillureAuthView() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error de Autenticacion", message: "Verifique su contraseña o su correo.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
///Extension que valida que cierta cadena sea formato email
extension String {
  var isEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: self)
  }
}
