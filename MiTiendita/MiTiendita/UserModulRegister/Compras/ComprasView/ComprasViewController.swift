//
//  ComprasViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import UIKit
import CoreData
class ComprasViewController: UIViewController, ComprasViewControllerProtocol {
    var presenter: ComprasPresenterProtocol?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var alturaTabla: NSLayoutConstraint!
    var compras: [NSManagedObject]?
    var user: User?
    var product: ProductDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        tableView?.dataSource = self
        presenter?.recivedData()
        presenter?.getComprasCD()
        
    }
    func recivedCompraFromCoreData(data: [NSManagedObject]){
        var lis: [NSManagedObject] = []
        compras?.removeAll()
        data.forEach{
            if $0.value(forKey: "userId") as! Int == user?.id{
                lis.append($0)
            }
        }
        compras = lis
        tableView?.reloadData()
    }

}
extension ComprasViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return compras?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ComprasViewCell
        let data = compras?[indexPath.row]
        cell.nameProduct?.text = data?.value(forKey: "nameProduct") as? String
        cell.cantidad?.text = "\(data?.value(forKey: "numerProduct") as? Int ?? 0)"
        cell.precio?.text = "Precio: $\(data?.value(forKey: "priceProduct") ?? 0) MNX"
        cell.imgProduct?.image = UIImage(data: data?.value(forKey: "imageProduct") as! Data)
        cell.total?.text = "Total: $\(data?.value(forKey: "priceProduct") ?? 0)MNX"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.layoutIfNeeded()
        self.alturaTabla.constant = tableView.contentSize.height
    }
}
