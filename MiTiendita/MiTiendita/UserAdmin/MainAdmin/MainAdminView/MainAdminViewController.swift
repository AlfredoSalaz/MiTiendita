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
    
    //var productByCategory: [Int: [Product]]?
    var productByCategory: Dictionary = [Int: [Product]]()
    var isOn = true
    @IBOutlet weak var leadinViewMenuHamburguesa: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAddCategory: UIButton?
    @IBOutlet weak var btnCar: UIButton?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    
    var menuHamburguesa: MenuMainAdminViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationView()
        tableView.delegate = self
        indicatorView?.startAnimating()
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
        print("get todo")
    }
    func onReceivedlistProduct(data: [Product]) {
        listProducts = data
        print("cargue todoooo")
        var list: [Product] = []
        for listCat  in listCategory! {
            for listPro in listProducts!{
                print("listCat \(listCat.id)")
                if listCat.id == listPro.category?.id{
                    list.append(listPro)
                }
            }
            productByCategory[listCat.id] = list
            print("id: \(listCat.id) tiene \(list.count)")
            list.removeAll()
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.indicatorView?.stopAnimating()
            self?.indicatorView?.isHidden = true
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
        cell.collectionView?.tag = indexPath.row + 1
        productsCategory = productByCategory[indexPath.row + 1]
        cell.listPr = productsCategory
        cell.collectionView?.reloadData()
        print("EL numero \(indexPath.row + 1) tiene \(productsCategory?.count)")
        
        return cell
    }
    
}

