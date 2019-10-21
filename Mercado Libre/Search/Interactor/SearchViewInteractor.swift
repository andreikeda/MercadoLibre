//
//  SearchViewInteractor.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 18/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SearchViewInteractorProtocol {
    func search(query: String)
}

protocol SearchViewRequestProtocol {
    func onRequestError(error: String)
    func onRequestSuccess(data: JSON)
}

class SearchViewInteractor {
    
    private var output: SearchViewInteractorOutputProtocol
    
    init(output: SearchViewInteractorOutputProtocol) {
        self.output = output
    }
}

extension SearchViewInteractor: SearchViewInteractorProtocol {
    func search(query: String) {
        APIHelper.helper.search(query: query, callback: self)
    }
}

extension SearchViewInteractor: SearchViewRequestProtocol {
    func onRequestError(error: String) {
        output.onSearchResultError(message: error)
    }
    
    func onRequestSuccess(data: JSON) {
        var results = [ResultModel]()
        for (_, json): (String, JSON) in data["results"] {
            var attrs: [AttributeModel] = [AttributeModel]()
            if (json["attributes"].count > 0) {
                for (_, attrJson): (String, JSON) in json["attributes"] {
                    let attr = AttributeModel(
                        id: attrJson["id"].rawValue as! String,
                        name: attrJson["name"].rawValue as! String,
                        valueId: attrJson["value_id"].rawValue as? String,
                        valueName: attrJson["value_name"].rawValue as? String,
                        attributeGroupId: attrJson["attribute_group_id"].rawValue as! String,
                        attributeGroupName: attrJson["attribute_group_name"].rawValue as! String)
                    attrs.append(attr)
                }
            }
            var tags: [String] = [String]()
            if (json["tags"].count > 0) {
                for (_, tag): (String, JSON) in json["tags"] {
                    tags.append(tag.rawString()!)
                }
            }
            let resultModel = ResultModel(
                id: json["id"].rawValue as! String,
                title: json["title"].rawValue as! String,
                price: json["price"].rawValue as! NSNumber,
                currencyId: json["currency_id"].rawValue as! String,
                condition: json["condition"].rawValue as! String,
                availableQuantity: json["available_quantity"].rawValue as! NSNumber,
                soldQuantity: json["sold_quantity"].rawValue as! NSNumber,
                thumbnail: json["thumbnail"].rawValue as? String,
                acceptsMercadoPago: json["accepts_mercadopago"].rawValue as! Bool,
                attributes: attrs,
                tags: tags)
            results.append(resultModel)
        }
        output.onSearchResultOk(result: results)
    }
}
