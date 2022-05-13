//
//  IndexEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import Foundation

class User: Decodable{
    static let shared = User()
    private init(){
        
    }
    var id: Int?
    var email: String?
    var password: String?
    var name: String?
    var role: String?
    var avatar: String?
    init(id: Int, email: String, password: String, name: String, role: String, avatar:String) {
        self.id = id
        self.email = email
        self.password = password
        self.name = name
        self.role = role
        self.avatar = avatar
    }
}

struct UserToken: Decodable{
    var access_token: String?
}
