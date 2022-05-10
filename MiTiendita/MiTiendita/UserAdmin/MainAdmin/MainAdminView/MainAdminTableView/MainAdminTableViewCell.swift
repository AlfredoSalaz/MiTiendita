//
//  MainAdminTableViewCell.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import UIKit

class MainAdminTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  
    var presenter: MainAdminPresenterProtocol?

    @IBOutlet weak var nameCategory: UILabel?
    @IBOutlet weak var collectionView: UICollectionView?
    @IBOutlet weak var btnEdit: UIButton?
    var listPr: [Product]?
    var delegate : MainAdminTableViewCellDelegate?
    var user: User?
    var cat: String?
    var actionButton: (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listPr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainAdminCollectionViewCell
        let data = listPr![indexPath.row]
        cell.nameProduct?.text = data.title
        cell.indicatorView?.startAnimating()
        guard let url = data.images?.first else {
            cell.indicatorView?.stopAnimating()
            cell.indicatorView?.isHidden = true
            return cell
        }
        DispatchQueue.main.async {
            if let url = URL(string: url){
                cell.imageProduct?.load(url: url)
            }else{
                cell.imageProduct?.image = UIImage(named: "error")
            }
            
            cell.indicatorView?.stopAnimating()
            cell.indicatorView?.isHidden = true
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = listPr![indexPath.row]
        let detail = ProductDetail(id: data.id , title: (data.title)!, price: (data.price)!, description: (data.description)!, category: (data.category!), images: data.images ?? [])
        print("user \(user?.name)")
        presenter?.openDetailProduct(data: detail, user: user)
    }
    @IBAction func actionEdith(_ sender: UIButton){
        self.actionButton?()
    }
    
}
protocol  MainAdminTableViewCellDelegate{
    func openProduct(data: Product)
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
