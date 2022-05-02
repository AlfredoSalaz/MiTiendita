//
//  MainAdminEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 27/04/22.
//

import Foundation

struct CategoryProduct: Codable{
    var id: Int
    var name: String?
    var image: String?
}

struct Product: Codable {
    var id: Int
    var title: String?
    var price: Int?
    var description: String?
    var category: CategoryProduct?
    var images: [String]?
}
