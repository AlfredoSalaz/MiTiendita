//
//  MainAdminViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import UIKit


class MainAdminViewController: UIViewController, MainAdminViewControllerProtocol , MenuHamburguesaViewControllerDelegate {
    var presenter: MainAdminPresenterProtocol?
    var user: User?
    var listCategory: [CategoryProduct]?
    var listProducts: [Product]?
    var productsCategory: [Product]?
    var isOn = true
    @IBOutlet weak var leadinViewMenuHamburguesa: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAddCategory: UIButton?
    @IBOutlet weak var btnCar: UIButton?
    
    var menuHamburguesa: MenuMainAdminViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationView()
        tableView.delegate = self
        presenter?.getCategories()
        presenter?.getProduct()
        
    }
    
    func validationView(){
        if user?.role == "admin"{
            btnAddCategory?.isHidden = false
            btnCar?.isHidden = true
        }else {
           btnAddCategory?.isHidden = true
            btnCar?.isHidden = false
        }
    }
    
    @IBAction func menuHamburguessa(_ sender: Any) {
        if isOn{
            leadinViewMenuHamburguesa.constant = 0
            isOn = false
        }else{
            hideMenuHamburguesa()
            isOn = true
        }
        
    }
    
    func hideMenuHamburguesa() {
        self.leadinViewMenuHamburguesa.constant = -250
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
                self.menuHamburguesa?.user = self.user
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
        
        let data = listCategory?[indexPath.row]
        cell.nameCategory?.text = data?.name
        //cell.collectionView?.delegate = self
        
        //cell.collectionView?.reloadData()
        return cell
    }
    
   
    
}

extension MainAdminViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productsCategory?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainAdminCollectionViewCell
        
        let data = productsCategory?[indexPath.row]
        
        cell.nameProduct?.text = data?.title
        return cell
    }
    
    
}
