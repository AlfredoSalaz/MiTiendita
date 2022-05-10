//
//  UserEntity.swift
//  MiTiendita
//
//  Created by user215494 on 4/26/22.
//

import Foundation


struct RegisterUsuarioApi: Decodable{
    var nombre: String
    var apellido: String
    var correo: String
    var password: String
    
    init(nombre:String, apellido:String, correo:String, password:String) {
        self.nombre = nombre
        self.apellido = apellido
        self.correo = correo
        self.password = password
    }
    
    
}

struct ValidateEmail: Codable{
    var isAvailable: Bool?
}
