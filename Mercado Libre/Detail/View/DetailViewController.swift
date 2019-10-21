//
//  DetailViewController.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 18/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewControllerProtocol {
    func setConditionText(text: String)
    func setMaxQuantityText(text: String)
    func setMercadoPagoText(text: String)
    func setMinQuantityText(text: String)
    func setQuantityStepper(minValue: Int, maxValue: Int, currentValue: Int)
    func setQuantityText(text: String)
    func setPriceText(text: String)
    func setTagsText(text: String)
    func setTitleText(text: String)
    func setThumbnailImage(url: String)
}

class DetailViewController: UIViewController {
    
    var result: ResultModel?
    
    private lazy var presenter: DetailViewPresenterProtocol = DetailViewPresenter(view: self)
    
    @IBOutlet weak var tagsView: UITextView!
    @IBOutlet weak var minQuantityLabel: UILabel!
    @IBOutlet weak var maxQuantityLabel: UILabel!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var quantityStepper: UIStepper!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var mercadoPagoLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let r = result {
            presenter.initComponents(result: r)
        }
    }
    
    @IBAction func onQuantityValueChanged(_ sender: Any) {
        presenter.onStepperValueChanged(newValue: quantityStepper.value)
    }
    
    @IBAction func onCloseButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func setConditionText(text: String) {
        conditionLabel.text = text
        conditionLabel.sizeToFit()
    }
    
    func setMaxQuantityText(text: String) {
        maxQuantityLabel.text = text
    }
    
    func setMercadoPagoText(text: String) {
        mercadoPagoLabel.text = text
        mercadoPagoLabel.sizeToFit()
    }
    
    func setMinQuantityText(text: String) {
        minQuantityLabel.text = text
    }
    
    func setQuantityStepper(minValue: Int, maxValue: Int, currentValue: Int) {
        quantityStepper.minimumValue = Double(minValue)
        quantityStepper.maximumValue = Double(maxValue)
        quantityStepper.value = Double(currentValue)
    }
    
    func setQuantityText(text: String) {
        quantityField.text = text
    }
    
    func setPriceText(text: String) {
        priceLabel.text = text
    }
    
    func setTagsText(text: String) {
        tagsView.text = text
    }
    
    func setThumbnailImage(url: String) {
        thumbnail.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "ProductImage"))
    }
    
    func setTitleText(text: String) {
        titleLabel.text = text
    }
}
