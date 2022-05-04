//
//  UserRegisterProductsEntity.swift
//  MiTiendita
//
//  Created by user215494 on 4/29/22.
//

import Foundation


struct UsuarioCore{
    var nombre: String
    var apellido: String
    var correo: String
    var password: String
    var direccion: String
    var tarjeta: Int
    
    init(nombre:String, apellido:String, correo:String, password:String, direccion:String, tarjeta:Int) {
        self.nombre = nombre
        self.apellido = apellido
        self.correo = correo
        self.password = password
        self.direccion = direccion
        self.tarjeta = tarjeta
    }
    
}
