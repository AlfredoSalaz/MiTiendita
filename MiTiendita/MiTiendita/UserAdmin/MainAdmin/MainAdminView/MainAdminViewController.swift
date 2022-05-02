//
//  MainAdminViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit


class MainAdminViewController: UIViewController, MainAdminViewControllerProtocol , MenuHamburguesaViewControllerDelegate {
    var presenter: MainAdminPresenterProtocol?
    
    var listCategory: [CategoryProduct]?
    var listProducts: [Product]?
    var productsCategory = [Product]()
    
    @IBOutlet weak var leadinViewMenuHamburguesa: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var menuHamburguesa: MenuMainAdminViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        presenter?.getCategories()
        presenter?.getProduct()
    }
    
    @IBAction func menuHamburguessa(_ sender: Any) {
        leadinViewMenuHamburguesa.constant = 0
    }
    func hideMenuHamburguesa() {
        self.leadinViewMenuHamburguesa.constant = -300
    }
    
    func onReceivedCategoryProduct(data: [CategoryProduct]){
        listCategory = data
    }
    func onReceivedlistProduct(data: [Product]) {
        listProducts = data
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    func faillureData() {
        print("falloooo")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "menuHamburguesa"){
            if let controller = segue.destination as? MenuMainAdminViewController {
                self.menuHamburguesa = controller
                self.menuHamburguesa?.delegate = self
                self.menuHamburguesa?.presenter = presenter
            }
        }
    }
    @IBAction  func registerCategory(_ sender: Any){
        presenter?.openRegisterCategory()
    }

}

extension MainAdminViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCategory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainAdminTableViewCell
        print("Resusar celda Tabla")
        let data = listCategory?[indexPath.row]
        productsCategory.removeAll()
        cell.nameCategory?.text = data?.name
        cell.collectionView?.delegate = self
        for category in listProducts!{
            if category.category?.name == data?.name{
                productsCategory.append(category)
            }
        }
        cell.collectionView?.reloadData()
        return cell
    }
    
   
    
}

extension MainAdminViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Count value \(productsCategory.count)")
        for lista in productsCategory{
            print("nameProduct: \(lista.title)")
        }
        return productsCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainAdminCollectionViewCell
        
        print("Resusar celda colection")
        let data = productsCategory[indexPath.row]
        
        cell.nameProduct?.text = data.title
        return cell
    }
    
    
}
