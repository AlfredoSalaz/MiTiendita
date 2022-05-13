//
//  RegisterTarjetaViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit

class RegisterTarjetaViewController: UIViewController, RegisterTarjetaViewControllerProtocol {
    var presenter: RegisterTarjetaPresenterProtocol?
    var user = User.shared
    @IBOutlet weak var lblBanco: UILabel?
    @IBOutlet weak var lblUser: UILabel?
    @IBOutlet weak var lblNumeroTarjeta: UILabel?
    @IBOutlet weak var lblVencimiento: UILabel?
    @IBOutlet weak var lblCV: UILabel?
    @IBOutlet weak var txtBanco: UITextField?
    @IBOutlet weak var txtUser: UITextField?
    @IBOutlet weak var txtNumeroTarjeta: UITextField?
    @IBOutlet weak var txtVencimiento: UITextField?
    @IBOutlet weak var txtCV: UITextField?
    
    @IBOutlet weak var btnGuardar: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDelegate()
        // Do any additional setup after loading the view.
    }
    func loadDelegate(){
        txtBanco?.delegate = self
        txtUser?.delegate = self
        txtNumeroTarjeta?.delegate = self
        txtVencimiento?.delegate = self
        txtCV?.delegate = self
    }
    
    @IBAction func saveTarjeta(_ sender: Any){
        //let users =  UserCD(id: user.id, nombre: user.name, apellido: "Default", correo: user.email, direccion: "default", password: user.password, tarjeta: "default")
        print("usuario \(user.id)")
        let data = TarjetaModel(cv: txtCV?.text ?? "", nombre: txtUser?.text ?? "", numero: txtNumeroTarjeta?.text ?? "", saldo: 100000.0 , vencimiento: txtVencimiento?.text ?? "", userId: user.id ?? 0, banco: txtBanco?.text ?? "")
        presenter?.saveTarjeta(data: data)
    }
    func savedTarjetaInCoreData(){
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }

}

extension RegisterTarjetaViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblNumeroTarjeta?.text = txtNumeroTarjeta?.text
        lblBanco?.text = txtBanco?.text
        lblUser?.text = txtUser?.text
        lblCV?.text = txtCV?.text
        lblVencimiento?.text = txtVencimiento?.text
    }
    
}
