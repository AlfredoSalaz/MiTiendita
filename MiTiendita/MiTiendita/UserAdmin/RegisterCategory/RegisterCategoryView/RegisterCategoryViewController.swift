//
//  RegisterCategoryViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

class RegisterCategoryViewController: UIViewController, RegisterCategoryViewControllerProtocol {
    var presenter: RegisterCategoryPresenterProtocol?
    
    @IBOutlet weak var imageCategory: UIImageView?
    @IBOutlet weak var nameCategory: UITextField?
    @IBOutlet weak var viewPiker: UIView?
    
    var imgCategoria: UIImage?
    var nameImage: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageCategory?.layer.borderWidth = 1
        imageCategory?.layer.borderColor = UIColor.magenta.cgColor
        viewPiker?.isHidden = true
    }
    

    @IBAction func addImage(_ sender: Any){
        viewPiker?.isHidden = !viewPiker!.isHidden
    }

    @IBAction func galery(_ sender: Any){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            
            let imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }
    }
    @IBAction func camera(_ sender: Any){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePicker: UIImagePickerController = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true)
        }
    }
    @IBAction func back(_ sender: Any){
        dismiss(animated: true)
    }
    @IBAction func savedData(_ sender: Any){
        presenter?.saveImage(type: "file", nameFile: nameImage ?? "defaultImg", image: imgCategoria ?? UIImage())
    }
    func recivedUrl(url: String){
        DispatchQueue.main.sync {
            guard let nameCategory = nameCategory?.text else {return}
            let data: [String: Any] = [
                "name": "\(nameCategory)",
                "image": "\(url)"
            ]
            self.presenter?.saveCategory(data: data)
        }
        
    }
}
extension RegisterCategoryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let imagen = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageCategory?.image = imagen
        self.viewPiker?.isHidden = true
        self.nameImage = UUID().uuidString
        self.imgCategoria = imagen
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("-----")
        dismiss(animated: true, completion: nil)
    }
}
