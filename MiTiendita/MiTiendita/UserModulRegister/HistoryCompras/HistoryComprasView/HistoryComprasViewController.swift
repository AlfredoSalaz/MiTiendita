//
//  HistoryComprasViewController.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import UIKit
import  CoreData

class HistoryComprasViewController: UIViewController, HistoryComprasViewControllerProtocol {
    var presenter: HistoryComprasPresenterProtocol?
    var listCompra: [NSManagedObject]?
    var user = User.shared
    @IBOutlet weak var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.delegate = self
        presenter?.getListHistory()
    }
    
    func successGetHistoryCompra(data: [NSManagedObject]) {
        var lis: [NSManagedObject] = []
        data.forEach{
            if $0.value(forKey: "userId") as? Int == user.id && $0.value(forKey: "status") as? String == "pagado"{
                lis.append($0)
            }
        }
        listCompra = lis
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    @IBAction func backAction(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}
extension HistoryComprasViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listCompra?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HistoryComprasTableViewCell
        let data = listCompra?[indexPath.row]
        cell.imgProduct?.image = UIImage(data: data?.value(forKey: "imageProduct") as! Data)
        cell.lblNameProduct?.text = data?.value(forKey: "nameProduct") as? String
        cell.lblTotal?.text = "Total: $\(data?.value(forKey: "total") ?? 0)MNX"
        cell.lblDescripcion?.text = "Cantidad: \(data?.value(forKey: "numerProduct") ?? 0 )"
        return cell
    }
    
    
}
