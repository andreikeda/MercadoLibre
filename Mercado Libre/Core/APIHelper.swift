//
//  APIHelper.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Alamofire
import Foundation
import SwiftyJSON

class APIHelper {
    
    static var helper: APIHelper = {
        return APIHelper()
    }()
    
    let BASE_URL = "https://api.mercadolibre.com/sites/MLA/"
    
    enum Endpoint: String {
        case search = "search"
    }
    
    func search(query: String) {
        let parameters: Parameters = ["q": query]
        let endpoint: String = Endpoint.search.rawValue
        let url: URL = URL(string: "\(BASE_URL)\(endpoint)")!
        Alamofire.request(url, parameters: parameters, encoding: URLEncoding.queryString).responseJSON { responseData in
            if ((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)

                for (index, resJson):(String, JSON) in json["results"] {
                    var attributes: [AttributeModel] = [AttributeModel]()
                    if (resJson["attributes"].count > 0) {
                        print("+ categories +\n")
                        for (_, attrJson): (String, JSON) in resJson["attributes"] {
                            let attr = AttributeModel(
                                id: attrJson["id"].rawValue as! String,
                                name: attrJson["name"].rawValue as! String,
                                valueId: attrJson["value_id"].rawValue as? String,
                                valueName: attrJson["value_name"].rawValue as? String,
                                attributeGroupId: attrJson["attribute_group_id"].rawValue as! String,
                                attributeGroupName: attrJson["attribute_group_name"].rawValue as! String)
                            attributes.append(attr)
                            print("\(attr.name) : \(attr.valueName) ")
                        }
                    }
                    let resultModel = ResultModel(
                        id: resJson["id"].rawValue as! String,
                        title: resJson["title"].rawValue as! String,
                        price: resJson["price"].rawValue as! NSNumber,
                        currencyId: resJson["currency_id"].rawValue as! String,
                        availableQuantity: resJson["available_quantity"].rawValue as! NSNumber,
                        soldQuantity: resJson["sold_quantity"].rawValue as! NSNumber,
                        thumbnail: resJson["thumbnail"].rawValue as? String,
                        attributes: attributes)
                    print("title: \(resultModel.title)\nprice: \(resultModel.currencyId) \(resultModel.price)\n")
                }
                /*
                if let resData = swiftyJsonVar["results"].arrayObject {
                    for i in 0 ..< resData.count {
                        let res = resData[i]
                        let resultModel = ResultModel(
                            id: res["id"],
                            title: res["title"],
                            price: res["price"],
                            currencyId: res["currency_id"],
                            availableQuantity: res["available_quantity"],
                            soldQuantity: res["sold_quantity"],
                            attributes: [AttributeModel])
                    }
                    print("\(resData)")
                }
 */
                /*
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
 */
            }
        }
    }
}
