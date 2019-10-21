//
//  DetailViewPresenter.swift
//  Mercado Libre
//
//  Created by Andre Ikeda on 18/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import Foundation

protocol DetailViewPresenterProtocol {
    func initComponents(result: ResultModel)
    func onStepperValueChanged(newValue: Double)
}

class DetailViewPresenter {
    
    private var view: DetailViewControllerProtocol
    
    init(view: DetailViewControllerProtocol) {
        self.view = view
    }
}

extension DetailViewPresenter: DetailViewPresenterProtocol {
    func initComponents(result: ResultModel) {
        view.setPriceText(text: result.formatPrice())
        view.setMaxQuantityText(text: "\(result.formatAvailableQuantity())")
        view.setQuantityText(text: "1")
        view.setMinQuantityText(text: "\(result.formatMinQuantity())")
        view.setMercadoPagoText(text: result.formatMercadoPago())
        view.setQuantityStepper(minValue: 1, maxValue: Int(truncating: result.availableQuantity), currentValue: 1)
        view.setConditionText(text: result.formatCondition())
        view.setTagsText(text: result.formatTags())
        view.setTitleText(text: result.title)
        
        if let thumb = result.thumbnail {
            view.setThumbnailImage(url: thumb)
        }
    }
    
    func onStepperValueChanged(newValue: Double) {
        view.setQuantityText(text: String(format: "%.0f", newValue))
    }
}
