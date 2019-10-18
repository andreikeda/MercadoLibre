//
//  SearchViewPresenter.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 18/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation

protocol SearchViewPresenterProtocol {
    func onSearchButtonClicked(query: String)
}

protocol SearchViewInteractorOutputProtocol {
    func onSearchResultOk(result: [ResultModel])
    func onSearchResultError(message: String)
}

class SearchViewPresenter {
    
    private var view: SearchViewControllerProtocol
    private lazy var interactor: SearchViewInteractorProtocol = SearchViewInteractor(output: self)
    
    init(view: SearchViewControllerProtocol) {
        self.view = view
    }
}

extension SearchViewPresenter: SearchViewPresenterProtocol {
    func onSearchButtonClicked(query: String) {
        view.showProgress()
        interactor.search(query: query)
    }
}

extension SearchViewPresenter: SearchViewInteractorOutputProtocol {
    func onSearchResultOk(result: [ResultModel]) {
        view.dismissProgress()
        view.showSearchResult(result: result)
    }
    
    func onSearchResultError(message: String) {
        view.dismissProgress()
        view.showError(error: message)
    }
}
