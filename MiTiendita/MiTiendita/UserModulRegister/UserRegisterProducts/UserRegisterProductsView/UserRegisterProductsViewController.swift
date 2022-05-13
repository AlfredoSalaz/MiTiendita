//
//  UserRegisterProductsViewController.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import UIKit

//1.- Creación de carpetas
//2.- Crear las clases de cada una
//3.-Creacion de los protocolos
//4.- Extendemos en las clases de los protocolos creados
//5.- Creamos el modúlo que se iniciara desde nuestra vista

class UserRegisterProductsViewController: UIViewController,  UserRegisterProductsViewControllerProtocol {
    
    @IBOutlet weak var tableDatos: UITableView!
    
    @IBOutlet weak var btnAddProduct: UIButton?
    var presenter: UserRegisterProductsPresenterProtocol?
    let product = ProductDetalSingleton.shared
    var listProducts = [Product.shared]
    var user = User.shared
    var isMultipleSlection = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDatos.allowsMultipleSelectionDuringEditing = true
        if user.role != "admin"{
            btnAddProduct?.isHidden = true
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        presenter?.getListProduct()
    }
    func receivedlistProduct(data: [Product]) {
        listProducts = data
        DispatchQueue.main.async { [weak self] in
            self?.tableDatos.reloadData()
        }
     
    }
    func faillureData() {
        print("Error al mostar")
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func btnBuscar(_ sender: Any) {
    }
    @IBAction func addNewProduct(_ sender: Any){
        presenter?.openRegisterProduct(isEdit: false)
    }
    @IBAction func cancelSelection(_ sender: Any){
        tableDatos.setEditing(false, animated: true)
        isMultipleSlection = false
    }
    @IBAction func multipleSelection(_ sender: Any){
        tableDatos.setEditing(true, animated: true)
        isMultipleSlection = true
        tableDatos.reloadData()
    }
}

extension UserRegisterProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserRegisterProductsTableView
        
        let data = listProducts[indexPath.row]
        if let url = URL(string: data.images?.first ?? ""){
            cell.imgProduct.load(url: url)
        }
        
        cell.nameProduct.text = data.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isMultipleSlection{
            print("me")
        }else{
            let data = listProducts[indexPath.row]
            product.id = data.id
            product.title = data.title
            product.price = data.price
            product.description = data.description
            product.category = data.category
            product.images = data.images
            presenter?.openDetailProducts()
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("deselection")
    }
    func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        var da = true
        let data = listProducts[indexPath.row]
        if data.category?.id == 1{
            da = false
        }
        return da
    }
}


