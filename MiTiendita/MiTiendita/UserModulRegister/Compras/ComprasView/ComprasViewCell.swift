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
    
    var actionButton: (()->())?
    
    @IBAction func addProduct(_ sender: Any){
        actionButton?()
    }
    @IBAction func dissmissProduct(_ sender: Any){
        actionButton?()
    }
    @IBAction func deleteProduct(_ sender: Any){
        actionButton?()
    }
}
