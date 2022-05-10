//
//  RegisterCategoryViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit
import CoreData

class RegisterCategoryViewController: UIViewController, RegisterCategoryViewControllerProtocol {
    var presenter: RegisterCategoryPresenterProtocol?
    @IBOutlet weak var imageCategory: UIImageView?
    @IBOutlet weak var nameCategory: UITextField?
    @IBOutlet weak var viewPiker: UIView?
    @IBOutlet weak var titleSection: UILabel?
    @IBOutlet weak var btnSave: UIButton?
    @IBOutlet weak var viewIndicator: UIActivityIndicatorView?
    var imgCategoria: UIImage?
    var nameImage: String?
    
    var isEdit: Bool?
    var category: CategoryProduct?
    var objectCoreData: NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewIndicator?.isHidden = true
        presenter?.recivedCategoryEdit()
        // Do any additional setup after loading the view.
        imageCategory?.layer.borderWidth = 1
        imageCategory?.layer.borderColor = UIColor.magenta.cgColor
        viewPiker?.isHidden = true
        loadData()
    }
    
    func loadData(){
        guard let data = category, let edit = isEdit else {
            return
        }
        nameCategory?.text = data.name
        imageCategory?.load(url: URL(string: data.image ?? "")!)
        print("esit \(edit)")
        if edit{
            print("---z-z")
            titleSection?.text = "Editar Categoria"
            btnSave?.setTitle("Editar", for: .normal)
        }
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
        viewIndicator?.isHidden = false
        viewIndicator?.startAnimating()
        presenter?.saveImage(type: "file", nameFile: nameImage ?? "defaultImg", image: imgCategoria ?? UIImage())
    }
    func recivedUrl(url: String){
        guard let isEdit = isEdit else{return}
        if isEdit{
            print("is edit")
            DispatchQueue.main.sync {
                guard let nameCategory = nameCategory?.text else {return}
                let data: [String: Any] = [
                    "name": "\(nameCategory)",
                    "image": "\(url)"
                ]
                guard let id = category?.id else{return}
                self.presenter?.edittCategory(data: data, id: id)
            }
        }else{
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
    func savedCategory(data: CategoryProduct){
        guard let isEdit = isEdit else {return}
        if isEdit{
            print("editado")
            let cat = CategoryRegister(name: data.name ?? "default", image: data.image ?? "", id: data.id)
            guard let object = self.objectCoreData else {return}
            print("have info")
            DispatchQueue.main.async {
                self.presenter?.updateInCoreData(data: cat, objectCoreData: object)
                self.dismiss(animated: true, completion: nil)
                self.viewIndicator?.isHidden = true
                self.viewIndicator?.stopAnimating()
            }
        }else{
            let cat = CategoryRegister(name: data.name ?? "default", image: data.image ?? "", id: data.id)
            DispatchQueue.main.async {
                self.presenter?.saveInCoreData(data: cat)
                self.dismiss(animated: true, completion: nil)
                self.viewIndicator?.isHidden = true
                self.viewIndicator?.stopAnimating()
            }
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
