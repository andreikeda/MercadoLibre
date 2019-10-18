//
//  SearchViewController.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewControllerProtocol {
    func dismissProgress()
    func showError(error: String)
    func showProgress()
    func showSearchResult(result: [ResultModel])
}

class SearchViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private let CELL_ID = "cellId"
    
    private lazy var presenter: SearchViewPresenterProtocol = SearchViewPresenter(view: self)
    private var progressIndicator = UIActivityIndicatorView(style: .large)
    private var results: [ResultModel] = [ResultModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressIndicator.center = view.center
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SearchViewController: SearchViewControllerProtocol {
    
    func dismissProgress() {
        progressIndicator.stopAnimating()
        progressIndicator.removeFromSuperview()
    }
    
    func showError(error: String) {
        let alert = UIAlertController(title: "Erro!", message: error, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
    }
    
    func showProgress() {
        progressIndicator.startAnimating()
        view.addSubview(progressIndicator)
    }
    
    func showSearchResult(result: [ResultModel]) {
        self.results = result
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! SearchViewTableCell
        cell.titleLabel.text = results[indexPath.row].title
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.onSearchButtonClicked(query: searchBar.text!)
    }
}
