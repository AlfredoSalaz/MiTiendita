//
//  RegisterProductsViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import UIKit

class RegisterProductsViewController: UIViewController, RegisterProductsViewControllerProtocol {
    var presenter: RegisterProductsPresenterProtocol?
    
    @IBOutlet weak var imageProduct: UIImageView?
    @IBOutlet weak var nameProduct: UITextField?
    @IBOutlet weak var price: UITextField?
    @IBOutlet weak var descriptionProduct: UITextField?
    @IBOutlet weak var idCategory: UITextField?
    @IBOutlet weak var viewLoadImage: UIView?
    
    var isEdit: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        validateView()
        viewLoadImage?.isHidden = true
        
    }
    private func validateView(){
        if isEdit {
            
        }else{
            
        }
    }
    
    @IBAction func addImage(_ sender: Any){
        viewLoadImage?.isHidden = !viewLoadImage!.isHidden
    }
    @IBAction func backView(_ sender: Any){
        
    }
    @IBAction func saveData(_ sender: Any){
        
    }
    @IBAction func galeryProduct(_ sender: Any){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }
    }
    @IBAction func cameraProduct(_ sender: Any){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }
    }
}

extension RegisterProductsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let imagen = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        print("image Ide \(UUID().uuidString)")
        imageProduct?.image = imagen
        self.viewLoadImage?.isHidden = true
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("-----")
        dismiss(animated: true, completion: nil)
    }
}
