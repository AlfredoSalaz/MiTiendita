//
//  DetailProductEntity.swift
//  MiTiendita
//
//  Created by user215494 on 5/2/22.
//

import Foundation

struct ProductDetail: Codable {
    var id: Int
    var title: String
    var price: Int
    var description: String
    var category: CategoryProduct
    var images: [String]
 
    init(id:Int, title:String, price:Int, description:String, category:CategoryProduct, images:[String]) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.images = images
    }
}

class ProductDetalSingleton {
    static let shared = ProductDetalSingleton()
    init() {
        
    }
    var id: Int?
    var title: String?
    var price: Int?
    var description: String?
    var category: CategoryProduct?
    var images: [String]?
}
