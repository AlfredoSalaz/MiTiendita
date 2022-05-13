//
//  DetailProductViewController.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import UIKit

class DetailProductViewController: UIViewController, DetailProductViewControllerProtocol {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var btnAddCar: UIButton?
    @IBOutlet weak var btnEdit: UIButton?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnDelete: UIButton?
    
    var presenter: DetailProductPresenterProtocol?
    
    var product = ProductDetalSingleton.shared
    var userSingleton = User.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //showData()
        collectionView.delegate = self
        collectionView.dataSource = self
        if userSingleton.role == "admin"{
            btnAddCar?.isHidden = true
        }else{
            btnEdit?.isHidden = true
            btnDelete?.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showData()
    }
    func showData() {
        lblTitle.text = product.title
        lblDescripcion.text = product.description
        lblCategory.text = product.category?.name
        lblPrecio.text = String("$ \(product.price ?? 0)")
    }

    @IBAction func btnAddCar(_ sender: Any) {
        //presenter?.openViewCompras(product: product, user: nil)
        let compraUser = ComprasUser(usId: userSingleton.id ?? 0, totalProd: Decimal(product.price ?? 0), totalCompra: Decimal(product.price ?? 0), prodId: product.id ?? 0, priceProducts: Decimal(product.price ?? 0), numberProducts: 1, imageProd: product.images?.first ?? "", nameProd: product.title ?? "")
        presenter?.saveCompraUser(compra: compraUser)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    func saveCompraCoreData(){
        presenter?.openViewCompras()
    }
    @IBAction func editProduct(_ sender: Any){
        presenter?.openEditProducts(isEdit: true)
    }
    @IBAction func actionDelete(_ sender: Any){
        presenter?.deleteProduct(id: product.id!)
    }
    func deleteSuccessProduct() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension DetailProductViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.images?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailProductCollectionViewCell
        
        let data = product.images?[indexPath.row]
        
        cell.imgProduct.load(url: URL(string: data ?? "")!)
        
        return cell
    }
    
    
}
