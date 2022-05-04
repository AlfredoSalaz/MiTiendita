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
    @IBOutlet weak var txtBusqueda: UITextField!
    
    var presenter: UserRegisterProductsPresenterProtocol?

    var listProducts: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}

extension UserRegisterProductsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserRegisterProductsTableView
        
        
        let data = listProducts?[indexPath.row]
        //cell.imgProduct.image = data?.images
        
        cell.nameProduct.text = data?.title
        cell.nameDescription.text = data?.description
        //cell.priceProduct.text = "\(data?.price)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = listProducts?[indexPath.row]
        
        let pro = ProductDetail(id: data!.id , title: (data?.title)!, price: (data?.price)!, description: (data?.description)!, category: (data?.category!)!, images: data?.images ?? [])
        
        presenter?.openDetailProducts(product: pro)
        
    }
    
}


