//
//  RegisterCategoryEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import Foundation

struct CategoryRegister: Encodable {
    static let shared = CategoryRegister()
    init(){
    }
    var name: String?
    var image: String?
    var id: Int?
    
    init(name: String, image:  String, id: Int) {
        self.image = image
        self.name = name
        self.id = id
    }
}
