//
//  RegisterTarjetaEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 12/05/22.
//

import Foundation

class TarjetaModel: Decodable{
    static let shared = TarjetaModel()
    init() {
        
    }
    var cv: String?
    var nombre: String?
    var numero: String?
    var saldo: Decimal?
    var vencimiento: String?
    var userId: Int?
    var banco: String?
    
    init(cv: String, nombre: String?, numero: String, saldo: Decimal, vencimiento: String, userId: Int, banco: String) {
        self.cv = cv
        self.nombre = nombre
        self.numero = numero
        self.saldo = saldo
        self.vencimiento = vencimiento
        self.userId = userId
        self.banco = banco
    }
}

