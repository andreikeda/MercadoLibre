//
//  SearchViewRouter.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 18/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewRouterProtocol {
    func performSegue()
}

class SearchViewRouter {
    
    private var viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

extension SearchViewRouter: SearchViewRouterProtocol {
    func performSegue() {
        viewController.performSegue(withIdentifier: "detailController", sender: nil)
    }
}
