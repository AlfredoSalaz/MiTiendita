//
//  RegisterCategoryEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 29/04/22.
//

import Foundation

struct CategoryRegister: Encodable {
    var name: String
    var image: String
    
    init(name: String, image:  String) {
        self.image = image
        self.name = name
    }
}
