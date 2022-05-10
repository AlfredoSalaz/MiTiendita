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
    
    @IBOutlet weak var imgProduct: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: DetailProductPresenterProtocol?
    
    var product: ProductDetail?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.recivedProductFromListProduct()
        showData()
        collectionView.delegate = self
        collectionView.dataSource = self
        print("el usario es \(user?.name)")
    }
    
    func showData() {
        
        lblTitle.text = product?.title
        lblDescripcion.text = product?.description
        lblCategory.text = product?.category.name
        lblPrecio.text = String("$ \(product?.price ?? 0)")
        
    }

    @IBAction func btnAddCar(_ sender: Any) {
        //presenter?.openViewCompras(product: product, user: nil)
        let compraUser = ComprasUser(usId: user?.id ?? 0, totalProd: Decimal(product?.price ?? 0), totalCompra: Decimal(product?.price ?? 0), prodId: product?.id ?? 0, priceProducts: Decimal(product?.price ?? 0), numberProducts: 1, imageProd: product?.images.first ?? "", nameProd: product?.title ?? "")
        presenter?.saveCompraUser(compra: compraUser)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    func saveCompraCoreData(){
        presenter?.openViewCompras(product: product, user: user)
    }
}

extension DetailProductViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product?.images.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DetailProductCollectionViewCell
        
        let data = product?.images[indexPath.row]
        print("Imagen: \(data)")
        cell.imgProduct.load(url: URL(string: data ?? "")!)
        
        return cell
    }
    
    
}
