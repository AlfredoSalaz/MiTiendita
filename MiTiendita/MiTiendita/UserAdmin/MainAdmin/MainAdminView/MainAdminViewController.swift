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
    var user = User.shared
    var listCategory = [CategoryProduct.shared]
    var listProducts = [Product.shared]
    var productsCategory: [Product]?
    
    var categoryCoreData: [NSManagedObject]?
    var productsCoreData: [NSManagedObject]?
    var productByCategory: Dictionary = [Int: [Product]]()
    var isOn = true
    var isReload = false
    
    @IBOutlet weak var leadinViewMenuHamburguesa: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    @IBOutlet weak var photoUser: UIImageView?
    @IBOutlet weak var nameUser: UILabel?
    
    @IBOutlet weak var stackUsuarios: UIStackView?
    @IBOutlet weak var viewStackCarShop: UIView?
    @IBOutlet weak var viewStackaddCategory: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView?.isHidden = true
        presenter?.recivedDataFromIndex()
        presenter?.getCategoryCoreD()
        //presenter?.resetEntityCoreData(name: "Categories")
        
        tableView.delegate = self
        
        loadDataInMenu()
        validationView()
    }
    
    func recivedDataFromPresenter(data: User){
        user.avatar = data.avatar
        user.email = data.email
        user.id = data.id
        user.password = data.password
        user.role = data.role
        user.name = data.name
        
    }
    func validationView(){
        if user.role == "admin"{
            viewStackaddCategory?.isHidden = false
            viewStackCarShop?.isHidden = true
        }else {
            viewStackaddCategory?.isHidden = true
            viewStackCarShop?.isHidden = false
        }
    }
    @IBAction func reloadDataInViewAndCoreData(_ sender: Any){
        isReload = true
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        presenter?.resetEntityCoreData(name: "Categories")
        presenter?.resetEntityCoreData(name: "ProductCD")
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
        for listCat  in listCategory {
            for listPro in listProducts{
                if listCat.id == listPro.category?.id{
                    list.append(listPro)
                }
            }
            productByCategory[listCat.id ?? 0] = list
            print("id: \(listCat.id) tiene \(list.count)")
            list.removeAll()
        }
        
        print("loadView")
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.indicatorView?.stopAnimating()
            self?.indicatorView?.isHidden = true
        }
        if isReload{
            DispatchQueue.main.async {
                self.saveInCoreDataCategories()
                self.isReload = false
            }
        }
        /*DispatchQueue.main.async {
            self.presenter?.getCategoryCoreD()
        }*/
    }
    func faillureData() {
        print("falloooo")
    }
    func saveInCoreDataCategories() {
        for data in listCategory{
            let dato = CategoryRegister(name: data.name ?? "", image: data.image ?? "", id: data.id ?? 0)
                presenter?.saveCategoryInCoreData(data: dato)
        }
        DispatchQueue.main.async {
            self.saveInCoreDataProduct()
        }
    }
    func saveInCoreDataProduct(){
        for data in listProducts{
            let dato = ProductRegister(idProduct: data.id! ,title: data.title ?? "", price: data.price ?? 0, descripc: data.description ?? "", categoryId: data.category?.id ?? 0, images: data.images ?? [""])
            presenter?.saveProductsCoreData(data: dato)
        }
    }
    
    @IBAction  func registerCategory(_ sender: Any){
        presenter?.openRegisterCategory()
    }
    
}

extension MainAdminViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MainAdminTableViewCell
        
        let data = listCategory[indexPath.row]
        if user.role != "admin"{
            cell.btnEdit?.isHidden = true
        }
        cell.nameCategory?.text = data.name
        cell.collectionView?.tag = indexPath.row + 1
        productsCategory = productByCategory[indexPath.row + 1]
        cell.actionButton = {
            self.actionButton(data: data)
        }
        cell.listPr = productsCategory
        cell.presenter = presenter
        print("user que enviare \(user.name)")
        cell.user = user
        cell.collectionView?.reloadData()
        
        return cell
    }
    func actionButton(data: CategoryProduct){
        categoryCoreData?.forEach{
            if $0.value(forKey: "id") as? Int == data.id{
                presenter?.editCategory(data: data, isEdit: true, objectCoreData: $0)
                return
            }
        }
    }
}

extension MainAdminViewController {
    func loadDataInMenu() {
        if user.role == "admin" {
            stackUsuarios?.isHidden = false
        }else{
            stackUsuarios?.isHidden = true
        }
        nameUser?.text = user.name
    }
    
    
    @IBAction func editUser(_ sender: Any) {
        presenter?.openEditUser(user: user, isEdditing: true)
    }
    
    @IBAction func categoryProduct(_ sender: Any) {
        hideMenuHamburguesa()
        isOn = true
    }
    @IBAction func productsAdmin(_ sender: Any) {
        /*let userSingleton = User.shared
        userSingleton.avatar = user.avatar
        userSingleton.email = user.email
        userSingleton.id = user.id
        userSingleton.password = user.password
        userSingleton.role = user.role
        userSingleton.name = user.name*/
        presenter?.openListProduct()
    }
    @IBAction func registerUserAdmin(_ sender: Any) {
        
        //presenter?.openEditUser(user: user!, isEdditing: false)
        presenter?.openViewUser()
        
    }
    @IBAction func carAction(_ sender: Any){
        presenter?.openViewComprasRouterfromMainPre(user: user)
    }

    @IBAction func cerrarSession(_ sender: Any){
        dismiss(animated: true)
    }
    
    func hideMenuHamburguesa() {
        self.leadinViewMenuHamburguesa.constant = -250
    }
    func recivedCategoryfromCoreData(data: [NSManagedObject]){
        self.categoryCoreData = data
        /*listCategory?.removeAll()
        var list: [CategoryProduct] = []
        for a in data{
            let cat = CategoryProduct(id: a.value(forKey: "id") as! Int, name: a.value(forKey: "name") as? String, image: a.value(forKey: "image") as? String)
                list.append(cat)
        }
        self.listCategory = list
        print("me")*/
        presenter?.getProductCoreData()
    }
    func resetDataInCoreData(){
        print("Se reseteo la info")
    }
    
    func recivedProductsFromCoreData(data: [NSManagedObject]) {
        print("recibi producto de CD \(data.count)")
        self.productsCoreData = data
        DispatchQueue.main.async { [weak self] in
            self?.indicatorView?.stopAnimating()
            self?.indicatorView?.isHidden = true
        }
        /*listProducts?.removeAll()
        var list: [Product] = []
        for a in data{
            let prod = Product(id: a.value(forKey: "idProduct") as! Int, title: a.value(forKey: "title") as? String, price: a.value(forKey: "price") as? Int, description: a.value(forKey: "descripcion") as? String, category: getCategoryForId(id: a.value(forKey: "idCategory") as! Int), images: a.value(forKey: "images") as? [String])
                list.append(prod)
        }
        self.listProducts = list
        
        var list1: [Product] = []
        for listCat  in listCategory! {
            for listPro in listProducts!{
                if listCat.id == listPro.category?.id{
                    list1.append(listPro)
                }
            }
            productByCategory[listCat.id] = list1
            print("id: \(listCat.id) tiene \(list1.count)")
            list1.removeAll()
        }
        print("loadView")
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.indicatorView?.stopAnimating()
            self?.indicatorView?.isHidden = true
        }*/
    }
    
    func getCategoryForId(id: Int) -> CategoryProduct{
        var cat: CategoryProduct?
        listCategory.forEach{
            if $0.id == id{
                cat = CategoryProduct(id: $0.id!, name: $0.name!, image: $0.image!)
            }
        }
        return cat!
    }
}
protocol MainAdminViewControllerDelegate {
    func updateTable()
}

extension MainAdminViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        print("mee")
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        presenter?.getCategories()
        presenter?.getProduct()
    }
}
