//
//  RegisterProductEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import Foundation

class ProductRegister: Codable{
    var title: String
    var price: Int
    var description: String
    var categoryId: Int
    var images: [URL]?
    
    init(title: String, price: Int, descrip: String, categ: Int) {
        self.categoryId = categ
        self.title = title
        self.price = price
        description = descrip
        //images = imag
    }
}
