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
    @IBOutlet weak var indicatorView: UIActivityIndicatorView?
    var compras: [NSManagedObject]?
    var userSin = User.shared
    var product = ProductDetalSingleton.shared
    var pressButton = false
    var cantidadProducto = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        presenter?.getComprasCD()
    }
    func recivedCompraFromCoreData(data: [NSManagedObject]){
        var lis: [NSManagedObject] = []
        compras?.removeAll()
        data.forEach{
            if $0.value(forKey: "userId") as? Int == userSin.id{
                lis.append($0)
            }
        }
        compras = lis
        tableView?.reloadData()
        DispatchQueue.main.async {
            self.indicatorView?.isHidden = true
            self.indicatorView?.stopAnimating()
        }
    }
    @IBAction func backButton(_ sender: Any){
        //let compraUser = ComprasUser(usId: user?.id ?? 0, totalProd: Decimal(product?.price ?? 0), totalCompra: Decimal(product?.price ?? 0), prodId: product?.id ?? 0, priceProducts: Decimal(product?.price ?? 0), numberProducts: 1, imageProd: product?.images.first ?? "", nameProd: product?.title ?? "")
        
        //presenter?.saveCompraUserCar(compra: compraUser)
        dismiss(animated: true, completion: nil)
    }
    func deleteCompra(object: NSManagedObject){
        presenter?.deleteCompraUser(object: object)
    }
    func updateCompraCD(object: NSManagedObject, data: ComprasUserCD){
        indicatorView?.isHidden = false
        indicatorView?.startAnimating()
        presenter?.updateCompraUserCar(compra: data, object: object)
    }
    func deletedObjectSuccessInCD() {
        DispatchQueue.main.async {
            self.presenter?.getComprasCD()
        }
    }
    func upatedSuccessCD() {
        DispatchQueue.main.async {
            self.indicatorView?.isHidden = true
            self.indicatorView?.stopAnimating()
        }
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
        
        cell.total?.text = "Total: $\(data?.value(forKey: "total") ?? 0)MNX"
        cell.cantidad?.text = "\(data?.value(forKey: "numerProduct") as? Int ?? 0)"
        
        cell.precio?.text = "Precio: $\(data?.value(forKey: "priceProduct") ?? 0) MNX"
        cell.imgProduct?.image = UIImage(data: data?.value(forKey: "imageProduct") as! Data)
        
        cell.actionAddProdut = {
            cell.cantidad?.text = "\(Int((cell.cantidad?.text)!)! + 1 )"
            let price: Double = (data?.value(forKey: "priceProduct")) as! Double
            let cantidad: Double = Double(cell.cantidad?.text ?? "0.0") ?? 0.0
            cell.total?.text = "Total: $\(price * cantidad)MNX"
            if let data = data{
                let compraUser = ComprasUserCD(usId: self.userSin.id ?? 0, totalProd: Decimal(price * cantidad), totalCompra: Decimal(price * cantidad), prodId: data.value(forKey: "productId") as! Int, priceProducts: Decimal(price), numberProducts: Int(cantidad), imageProd: data.value(forKey: "imageProduct") as! Data, nameProd: data.value(forKey: "nameProduct") as! String)
                self.updateCompraCD(object: data, data: compraUser)
            }
        }
        cell.actionDissProduct = {
            if Int(cell.cantidad?.text ?? "1")! >= 2{
                cell.cantidad?.text = "\(Int((cell.cantidad?.text)!)! - 1 )"
                let price: Double = (data?.value(forKey: "priceProduct")) as! Double
                let cantidad: Double = Double(cell.cantidad?.text ?? "0.0") ?? 0.0
                cell.total?.text = "Total: $\(price * cantidad)MNX"
                if let data = data{
                    let compraUser = ComprasUserCD(usId: self.userSin.id ?? 0, totalProd: Decimal(price * cantidad), totalCompra: Decimal(price * cantidad), prodId: data.value(forKey: "productId") as! Int, priceProducts: Decimal(price), numberProducts: Int(cantidad), imageProd: data.value(forKey: "imageProduct") as! Data, nameProd: data.value(forKey: "nameProduct") as! String)
                    self.updateCompraCD(object: data, data: compraUser)
                }
            }
        }
        cell.actionDeleteProduct = {
            if let data = data{
                self.deleteCompra(object: data)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.layoutIfNeeded()
        self.alturaTabla.constant = tableView.contentSize.height
    }
}
