//
//  HistoryComprasTableViewCell.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 13/05/22.
//

import UIKit

class HistoryComprasTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView?
    @IBOutlet weak var lblNameProduct: UILabel?
    @IBOutlet weak var lblDescripcion: UILabel?
    @IBOutlet weak var lblTotal: UILabel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
