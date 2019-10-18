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
    
    func search(query: String, callback: SearchViewRequestProtocol) {
        let parameters: Parameters = ["q": query]
        let endpoint: String = Endpoint.search.rawValue
        let url: URL = URL(string: "\(BASE_URL)\(endpoint)")!
        Alamofire.request(url, parameters: parameters, encoding: URLEncoding.queryString).responseJSON { response in
            switch response.result {
            case .success(let value):
                callback.onRequestSuccess(data: JSON(value))
            case .failure(let error):
                callback.onRequestError(error: error.localizedDescription)
            }
        }
    }
}
