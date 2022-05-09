//
//  IndexEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 26/04/22.
//

import Foundation

struct User: Decodable{
    var id: Int
    var email: String?
    var password: String?
    var name: String?
    var role: String?
    var avatar: String?
}

struct UserToken: Decodable{
    var access_token: String?
}
