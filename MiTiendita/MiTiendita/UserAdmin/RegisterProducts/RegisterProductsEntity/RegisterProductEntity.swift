//
//  RegisterProductEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 02/05/22.
//

import Foundation

class ProductRegister: Encodable{
    var idProduct: Int
    var title: String
    var price: Int
    var descripcion: String
    var categoryId: Int
    var images: [String]
    
    init(idProduct: Int, title: String, price: Int, descripc: String, categoryId: Int, images: [String]) {
        self.idProduct = idProduct
        self.title = title
        self.price = price
        self.descripcion = descripc
        self.categoryId = categoryId
        self.images = images
    }
}
