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
    var product: [String: Any]?
    var isEdit: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        validateView()
        viewLoadImage?.isHidden = true
        nameProduct?.layer.borderWidth = 1
        price?.layer.borderWidth = 1
        descriptionProduct?.layer .borderWidth = 1
        nameProduct?.layer.borderColor = UIColor.magenta.cgColor
        price?.layer.borderColor = UIColor.magenta.cgColor
        descriptionProduct?.layer.borderColor = UIColor.magenta.cgColor
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
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveData(_ sender: Any){
        loADdATA()
        //print("product: \(product?.title)")
        presenter?.saveNewProduct(data: product!)
    }
    func loADdATA(){
        
        let titulo = nameProduct?.text ?? "vACIO"
        let catId = Int(idCategory?.text ?? "0") ?? 0
       let desc = descriptionProduct?.text ?? "vACIO1"
        let prices = Int(price?.text ?? "0") ?? 0
        let url = "https://api.lorem.space/image/furniture?w=640&h=480&r=3085"
        product = [
            "title": titulo,
            "price": prices,
            "description": desc,
            "categoryId": catId,
            "images": [
                url
              ]
        ]
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
