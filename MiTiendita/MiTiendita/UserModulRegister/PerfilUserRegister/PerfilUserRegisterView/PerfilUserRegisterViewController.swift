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
    
    var imgUser: UIImage?
    var nameImage: String?
    
    @IBOutlet weak var pickerView: UIView!
    
    var presenter: PerfilUserRegisterPresenterProtocol?
    var user: User?
    
    var userCore: UsuarioCore?
    
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
        
        pickerView?.isHidden = true
        
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
        
        let usuario = UsuarioCore(nombre: txtNombre.text ?? "", apellido: txtApellido.text ?? "", correo: txtCorreo.text ?? "", password: txtPassword.text ?? "", direccion: txtDireccion.text ?? "", tarjeta: Int(txtTarjetaCredito.text ?? "") ?? 0)
            
            presenter?.saveUserInfo(user: usuario)
        
        dismiss(animated: true)
        
    }
    
    @IBAction func btnBack(_ sender: Any){
        self.dismiss(animated: true)
    }
    
    
    @IBAction func addImage(_ sender: Any) {
        pickerView.isHidden = !pickerView!.isHidden
    }
    
    @IBAction func galery(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }
    }
    
    @IBAction func camera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }
    }
    
}

extension PerfilUserRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let imagen = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgUserPerfil?.image = imagen
        self.pickerView?.isHidden = true
        self.nameImage = UUID().uuidString
        self.imgUser = imagen
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("-----")
        dismiss(animated: true, completion: nil)
    }
}
