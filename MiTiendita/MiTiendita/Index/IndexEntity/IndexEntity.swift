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
}

struct UserToken: Decodable{
    var access_token: String?
}
