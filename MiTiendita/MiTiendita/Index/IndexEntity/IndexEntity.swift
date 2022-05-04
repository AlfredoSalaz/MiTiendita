//
//  IndexEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import Foundation

struct User: Decodable{
    var id: Int
    var email: String
    var password: String
    var name: String
    var role: String
    
    init(id: Int, email: String, password: String, name: String, role: String) {
        self.name = name
        self.email = email
        self.password = password
        self.name = name
        self.role = role
        self.id = id
    }
}
