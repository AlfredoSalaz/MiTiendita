//
//  MainAdminViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//
import CoreData
import UIKit


class MainAdminViewController: UIViewController, MainAdminViewControllerProtocol {
    var presenter: MainAdminPresenterProtocol?
    var user: User?
    var listCategory: [CategoryProduct]?
    var listProducts: [Product]?
    var productsCategory: [Product]?
    
    var categoryCoreData: [NSManagedObject]?
    var productByCategory: Dictionary = [Int: [Product]]()
    var isOn = true
    @IBOutlet weak var leadinViewMenuHamburguesa: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAddCategory: UIButton?
    @IBOutlet weak var btnCar: UIButton?
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    @IBOutlet weak var photoUser: UIImageView?
    @IBOutlet weak var nameUser: UILabel?
    @IBOutlet weak var stackUsuarios: UIStackView?
    @IBOutlet weak var btnReload: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView?.isHidden = true
        presenter?.recivedDataFromIndex()
        //presenter?.getCategoryCoreD()
        //presenter?.resetEntityCoreData(name: "Categories")
        tableView.delegate = self
        
        loadDataInMenu()
        validationView()
    }
    
    func recivedDataFromPresenter(data: User){
        self.user = data
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
    @IBAction func reloadDataInViewAndCoreData(_ sender: Any){
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        presenter?.resetEntityCoreData(name: "Categories")
        presenter?.getCategories()
        presenter?.getProduct()
        
    }
    @IBAction func loadDataFromCD(_ sender: Any){
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        presenter?.getCategoryCoreD()
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
    
    func onReceivedCategoryProduct(data: [CategoryProduct]){
        listCategory = data
    }
    func onReceivedlistProduct(data: [Product]) {
        listProducts = data
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
        
        print("loadView")
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.indicatorView?.stopAnimating()
            self?.indicatorView?.isHidden = true
        }
        DispatchQueue.main.async {
            self.saveInCoreDataCategories()
        }
        
    }
    func faillureData() {
        print("falloooo")
    }
    func saveInCoreDataCategories() {
        guard let listCategory = self.listCategory else {
            return
        }
        for data in listCategory{
            let dato = CategoryRegister(name: data.name ?? "", image: data.image ?? "", id: data.id)
                presenter?.saveCategoryInCoreData(data: dato)
        }
    }
    
    @IBAction  func registerCategory(_ sender: Any){
        presenter?.openRegisterCategory()
    }
    
}

extension MainAdminViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("me actualice \(listCategory?.count)")
        return listCategory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainAdminTableViewCell
        
        let data = listCategory?[indexPath.row]
        cell.nameCategory?.text = data?.name
        cell.collectionView?.tag = indexPath.row + 1
        productsCategory = productByCategory[indexPath.row + 1]
        cell.listPr = productsCategory
        cell.presenter = presenter
        cell.collectionView?.reloadData()
        
        return cell
    }
}

extension MainAdminViewController {
    func loadDataInMenu() {
        if user?.role == "admin" {
            stackUsuarios?.isHidden = false
        }else{
            stackUsuarios?.isHidden = true
        }
        nameUser?.text = user?.name
    }
    
    
    @IBAction func editUser(_ sender: Any) {
        //presenter?.openEditUser(user: user!, isEdditing: true)
    }
    
    @IBAction func categoryProduct(_ sender: Any) {
        hideMenuHamburguesa()
        isOn = true
    }
    @IBAction func productsAdmin(_ sender: Any) {
        presenter?.openListProduct()
    }
    @IBAction func registerUserAdmin(_ sender: Any) {
        
        //presenter?.openEditUser(user: user!, isEdditing: false)
        presenter?.openViewUser()
        
    }

    @IBAction func cerrarSession(_ sender: Any){
        dismiss(animated: true)
    }
    
    func hideMenuHamburguesa() {
        self.leadinViewMenuHamburguesa.constant = -250
    }
    func recivedCategoryfromCoreData(data: [NSManagedObject]){
        self.categoryCoreData = data
        print("coredata \(data.count)")
        listCategory?.removeAll()
        var list: [CategoryProduct] = []
        for a in data{
            let cat = CategoryProduct(id: a.value(forKey: "id") as! Int, name: a.value(forKey: "name") as? String, image: a.value(forKey: "image") as? String)
                list.append(cat)
        }
        self.listCategory = list
        print("data \(listCategory?.count)d")
        presenter?.getProduct()
    }
    func resetDataInCoreData(){
        print("Se reseteo la info")
    }
    
}
