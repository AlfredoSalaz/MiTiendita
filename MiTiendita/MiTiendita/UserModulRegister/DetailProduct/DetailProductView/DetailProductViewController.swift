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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.recivedProductFromListProduct()
        showData()
    }
    
    func showData() {
        
        lblTitle.text = product?.title
        lblDescripcion.text = product?.description
        lblCategory.text = product?.category.name
        lblPrecio.text = String("$ \(product?.price ?? 0)")

    }

    @IBAction func btnAddCar(_ sender: Any) {
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
}


