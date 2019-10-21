//
//  Mercado_LibreTests.swift
//  Mercado LibreTests
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import XCTest
@testable import Mercado_Libre

class Mercado_LibreTests: XCTestCase {
    
    var sut: ResultModel!

    override func setUp() {
        super.setUp()
        sut = ResultModel(id: "abd", title: "motorola", price: 12000, currencyId: "ARS", condition: "new", availableQuantity: 120, soldQuantity: 10, thumbnail: nil, acceptsMercadoPago: true, attributes: [AttributeModel](), tags: ["good_quality_picture", "good_quality_thumbnail", "brand_verified"])
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFormatConditionOutput() {
        let text = sut.formatCondition()
        XCTAssertEqual(text, "Estado de uso:\nnew")
    }
    
    func testFormatTagsOutput() {
        let text = sut.formatTags()
        XCTAssertEqual(text, "good_quality_picture, good_quality_thumbnail, brand_verified, ")
    }
    
    func testFormatPriceOutput() {
        let text = sut.formatPrice()
        XCTAssertEqual(text, "ARS$ 12000")
    }
    
    func testFormatAcceptsMercadoPagoOutput() {
        let text = sut.formatMercadoPago()
        XCTAssertEqual(text, "Aceitamos\nMercadoPago")
    }
    
    func testFormatNotAcceptsMercadoPagoOutput() {
        sut.acceptsMercadoPago = false
        let text = sut.formatMercadoPago()
        XCTAssertEqual(text, "Não aceitamos\nMercadoPago")
    }
    
    func testFormatMinQuantityOutput() {
        let text = sut.formatMinQuantity()
        XCTAssertEqual(text, "Min: 1")
    }
    
    func testFormatSoldQuantityOutput() {
        let text = sut.formatSoldQuantity()
        XCTAssertEqual(text, "Vendidos: 10")
    }
    
    func testFormatAvailableQuantityOutput() {
        let text = sut.formatAvailableQuantity()
        XCTAssertEqual(text, "Máx: 120")
    }

}
