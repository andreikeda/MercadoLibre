//
//  SearchViewPresenter.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 18/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewPresenterProtocol {
    func onSearchButtonClicked(query: String)
    func onSearchResultItemSelected()
}

protocol SearchViewInteractorOutputProtocol {
    func onSearchResultOk(result: [ResultModel])
    func onSearchResultError(message: String)
}

class SearchViewPresenter {
    
    private var view: SearchViewControllerProtocol
    private var router: SearchViewRouterProtocol
    private lazy var interactor: SearchViewInteractorProtocol = SearchViewInteractor(output: self)
    
    init(view: SearchViewControllerProtocol) {
        self.view = view
        router = SearchViewRouter(viewController: view as! UIViewController)
    }
}

extension SearchViewPresenter: SearchViewPresenterProtocol {
    func onSearchButtonClicked(query: String) {
        if query.isEmpty {
            view.showError(error: "Digite o que deseja procurar")
        } else {
            view.showProgress()
            interactor.search(query: query)
        }
    }
    
    func onSearchResultItemSelected() {
        router.performSegue()
    }
}

extension SearchViewPresenter: SearchViewInteractorOutputProtocol {
    func onSearchResultOk(result: [ResultModel]) {
        view.dismissProgress()
        if (result.count > 0) {
            view.showSearchResult(result: result)
        } else {
            view.showError(error: "Não foram encontrados resultados.")
        }
    }
    
    func onSearchResultError(message: String) {
        view.dismissProgress()
        view.showError(error: message)
    }
}
