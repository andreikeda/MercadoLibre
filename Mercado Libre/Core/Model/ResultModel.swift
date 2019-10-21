//
//  SellerModel.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//
import Foundation

protocol ResultModelProtocol {
    func formatAvailableQuantity() -> String
    func formatCondition() -> String
    func formatMercadoPago() -> String
    func formatMinQuantity() -> String
    func formatSoldQuantity() -> String
    func formatPrice() -> String
    func formatTags() -> String
}

class ResultModel {
    
    let id: String
    let title: String
    let price: NSNumber
    let currencyId: String
    let availableQuantity: NSNumber
    let soldQuantity: NSNumber
    let condition: String
    let thumbnail: String?
    var acceptsMercadoPago: Bool
    
    var attributes: [AttributeModel]
    var tags: [String]
    
    init(id: String, title: String, price: NSNumber, currencyId: String, condition: String, availableQuantity: NSNumber, soldQuantity: NSNumber, thumbnail: String?, acceptsMercadoPago: Bool, attributes: [AttributeModel], tags: [String]) {
        self.id = id
        self.title = title
        self.price = price
        self.currencyId = currencyId
        self.condition = condition
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.thumbnail = thumbnail
        self.acceptsMercadoPago = acceptsMercadoPago
        self.attributes = attributes
        self.tags = tags
    }
}

extension ResultModel: ResultModelProtocol {
    func formatAvailableQuantity() -> String {
        return "Máx: \(availableQuantity)"
    }
    
    func formatCondition() -> String {
        return "Estado de uso:\n\(condition)"
    }
    
    func formatMinQuantity() -> String {
        return "Min: 1"
    }
    
    func formatMercadoPago() -> String {
        if (acceptsMercadoPago) {
            return "Aceitamos\nMercadoPago"
        }
        return "Não aceitamos\nMercadoPago"
    }
    
    func formatPrice() -> String {
        return "\(currencyId)$ \(price)"
    }
    
    func formatSoldQuantity() -> String {
        return "Vendidos: \(soldQuantity)"
    }
    
    func formatTags() -> String {
        var aux = ""
        for tag in tags {
            aux += "\(tag), "
        }
        return aux
    }
}
