//
//  ComprasViewCell.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import UIKit

class ComprasViewCell: UITableViewCell {
    
    @IBOutlet weak var imgProduct: UIImageView?
    @IBOutlet weak var nameProduct: UILabel?
    @IBOutlet weak var cantidad: UILabel?
    @IBOutlet weak var precio: UILabel?
    @IBOutlet weak var total: UILabel?
    
    var actionAddProdut: (()->())?
    var actionDissProduct: (()->())?
    var actionDeleteProduct: (()->())?
    
    @IBAction func addProduct(_ sender: Any){
        actionAddProdut?()
    }
    @IBAction func dissmissProduct(_ sender: Any){
        actionDissProduct?()
    }
    @IBAction func deleteProduct(_ sender: Any){
        actionDeleteProduct?()
    }
}
