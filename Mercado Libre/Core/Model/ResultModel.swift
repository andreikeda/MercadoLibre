//
//  SellerModel.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//
import Foundation

protocol ResultModelProtocol {
    func formatSoldQuantity() -> String
    func formatPrice() -> String
}

class ResultModel {
    
    let id: String
    let title: String
    let price: NSNumber
    let currencyId: String
    let availableQuantity: NSNumber
    let soldQuantity: NSNumber
    let thumbnail: String?
    
    var attributes: [AttributeModel]
    
    init(id: String, title: String, price: NSNumber, currencyId: String, availableQuantity: NSNumber, soldQuantity: NSNumber, thumbnail: String?, attributes: [AttributeModel]) {
        self.id = id
        self.title = title
        self.price = price
        self.currencyId = currencyId
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.thumbnail = thumbnail
        self.attributes = attributes
    }
}

extension ResultModel: ResultModelProtocol {
    func formatPrice() -> String {
        return "\(currencyId)$ \(price)"
    }
    
    func formatSoldQuantity() -> String {
        return "Vendidos: \(soldQuantity)"
    }
}

/**
 "id": "MLA810645375",
     "site_id": "MLA",
     "title": "Motorola G6 Plus 64 Gb Nimbus",
     "seller": {
         "id": 143125485,
         "power_seller_status": "platinum",
         "car_dealer": false,
         "real_estate_agency": false,
         "tags": []
     },
     "price": 17999,
     "currency_id": "ARS",
     "available_quantity": 100,
     "sold_quantity": 0,
     "buying_mode": "buy_it_now",
     "listing_type_id": "gold_special",
     "stop_time": "2039-08-17T04:00:00.000Z",
     "condition": "new",
     "permalink": "https://www.mercadolibre.com.ar/p/MLA9452524",
     "thumbnail": "http://mla-s2-p.mlstatic.com/795558-MLA31003306206_062019-I.jpg",
     "accepts_mercadopago": true,
     "installments": {
         "quantity": 12,
         "amount": 2456.41,
         "rate": 63.77,
         "currency_id": "ARS"
     },
     "address": {
         "state_id": "AR-C",
         "state_name": "Capital Federal",
         "city_id": "TUxBQkJBTDMxMDZa",
         "city_name": "Balvanera"
     },
     "shipping": {
         "free_shipping": false,
         "mode": "custom",
         "tags": [],
         "logistic_type": "custom",
         "store_pick_up": true
     },
     "seller_address": {
         "id": "",
         "comment": "",
         "address_line": "",
         "zip_code": "",
         "country": {
             "id": "AR",
             "name": "Argentina"
         },
         "state": {
             "id": "AR-C",
             "name": "Capital Federal"
         },
         "city": {
             "id": "TUxBQkJBTDMxMDZa",
             "name": "Balvanera"
         },
         "latitude": "",
         "longitude": ""
     },
     "attributes": [
         {
             "name": "Marca",
             "value_id": "2503",
             "value_name": "Motorola",
             "value_struct": null,
             "attribute_group_id": "OTHERS",
             "attribute_group_name": "Otros",
             "source": 1,
             "id": "BRAND"
         },
         {
             "attribute_group_name": "Otros",
             "source": 1,
             "id": "CPU_MODEL",
             "name": "Modelo de CPU",
             "value_id": "7070889",
             "value_name": "4x2.2 GHz Cortex-A53/4x1.8 GHz Cortex-A53",
             "value_struct": null,
             "attribute_group_id": "OTHERS"
         },
     ],
     "original_price": null,
     "category_id": "MLA1055",
     "official_store_id": 229,
     "catalog_product_id": "MLA9452524",
     "tags": [
         "brand_verified",
         "extended_warranty_eligible",
         "good_quality_picture",
         "good_quality_thumbnail",
         "immediate_payment"
     ],
     "catalog_listing": true
 }
 */
