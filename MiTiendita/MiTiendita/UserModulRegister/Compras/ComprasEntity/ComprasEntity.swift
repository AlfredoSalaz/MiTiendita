//
//  ComprasEntity.swift
//  MiTiendita
//
//  Created by Alfredo Salazar on 10/05/22.
//

import Foundation

class ComprasUser: Encodable {
    
    var userId: Int
    var totalProduct: Decimal
    var total: Decimal
    var productId: Int
    var priceProduct: Decimal
    var numberProduct: Int
    var imageProduct: String
    var nameProduct: String
    var status: String
    init(usId: Int, totalProd: Decimal, totalCompra: Decimal, prodId: Int, priceProducts: Decimal, numberProducts: Int, imageProd: String, nameProd: String, status: String) {
        userId = usId
        totalProduct = totalProd
        total = totalCompra
        productId = prodId
        priceProduct = priceProducts
        numberProduct = numberProducts
        imageProduct = imageProd
        nameProduct = nameProd
        self.status = status
    }
}
class ComprasUserCD: Encodable {
    
    var userId: Int
    var totalProduct: Decimal
    var total: Decimal
    var productId: Int
    var priceProduct: Decimal
    var numberProduct: Int
    var imageProduct: Data
    var nameProduct: String
    var status: String
    
    init(usId: Int, totalProd: Decimal, totalCompra: Decimal, prodId: Int, priceProducts: Decimal, numberProducts: Int, imageProd: Data, nameProd: String, status: String) {
        userId = usId
        totalProduct = totalProd
        total = totalCompra
        productId = prodId
        priceProduct = priceProducts
        numberProduct = numberProducts
        imageProduct = imageProd
        nameProduct = nameProd
        self.status = status
    }
}
