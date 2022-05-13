//
//  RegisterTarjetaViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import UIKit
import CoreData

class RegisterTarjetaViewController: UIViewController, RegisterTarjetaViewControllerProtocol {
    var presenter: RegisterTarjetaPresenterProtocol?
    var user = User.shared
    var isEditt: Bool?
    var data: NSManagedObject?
    let tarjeta = TarjetaModel.shared
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
    @IBOutlet weak var btnDelete: UIButton?
    @IBOutlet weak var btnGuardar: UIButton?
    
    let myColor : UIColor = UIColor.magenta
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtBanco?.layer.borderWidth = 2
        txtBanco?.layer.borderColor = myColor.cgColor
        txtUser?.layer.borderWidth = 2
        txtUser?.layer.borderColor = myColor.cgColor
        txtNumeroTarjeta?.layer.borderWidth = 2
        txtNumeroTarjeta?.layer.borderColor = myColor.cgColor
        txtVencimiento?.layer.borderWidth = 2
        txtVencimiento?.layer.borderColor = myColor.cgColor
        txtCV?.layer.borderWidth = 2
        txtCV?.layer.borderColor = myColor.cgColor
        
        btnGuardar?.layer.borderWidth = 2
        btnGuardar?.layer.borderColor = myColor.cgColor
        
        presenter?.loadDataInView()
        loadDelegate()
        // Do any additional setup after loading the view.
        if isEditt!{
            loadWhenIsEdit()
        }else {
            btnDelete?.isHidden = true
        }
    }
    func loadDelegate(){
        txtBanco?.delegate = self
        txtUser?.delegate = self
        txtNumeroTarjeta?.delegate = self
        txtVencimiento?.delegate = self
        txtCV?.delegate = self
    }
    func loadWhenIsEdit(){
        txtBanco?.text = tarjeta.banco
        txtUser?.text = tarjeta.nombre
        txtNumeroTarjeta?.text = tarjeta.numero
        txtVencimiento?.text = tarjeta.vencimiento
        txtCV?.text = tarjeta.cv
        
        lblBanco?.text = tarjeta.banco
        lblUser?.text = tarjeta.nombre
        lblNumeroTarjeta?.text = tarjeta.numero
        lblVencimiento?.text = tarjeta.vencimiento
        lblCV?.text = tarjeta.cv
    }
    
    @IBAction func saveTarjeta(_ sender: Any){
        
        let datas = TarjetaModel(cv: txtCV?.text ?? "", nombre: txtUser?.text ?? "", numero: txtNumeroTarjeta?.text ?? "", saldo: 100000.0 , vencimiento: txtVencimiento?.text ?? "", userId: user.id ?? 0, banco: txtBanco?.text ?? "")
        if isEditt!{
            print("update")
            presenter?.updateTrajeta(data: datas, object: data!)
        }else{
            presenter?.saveTarjeta(data: datas)
        }
    }
    func savedTarjetaInCoreData(){
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func actionDelete(_ sender: Any){
        presenter?.deleteTarjeta(object: data)
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
