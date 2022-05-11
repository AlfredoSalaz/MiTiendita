//
//  MainAdminEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import Foundation

struct CategoryProduct: Codable{
    static let shared = CategoryProduct()
    private init() {
        
    }
    var id: Int?
    var name: String?
    var image: String?
    
    init(id: Int, name: String, image: String) {
        self.image = image
        self.id = id
        self.name = name
    }
}

struct Product: Codable {
    static let shared = Product()
    private init() {
        
    }
    var id: Int?
    var title: String?
    var price: Int?
    var description: String?
    var category: CategoryProduct?
    var images: [String]?
}
