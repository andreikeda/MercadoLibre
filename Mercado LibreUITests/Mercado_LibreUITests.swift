//
//  Mercado_LibreUITests.swift
//  Mercado LibreUITests
//
//  Created by Andre Ikeda on 17/10/19.
//  Copyright © 2019 Andre Ikeda. All rights reserved.
//

import XCTest

class Mercado_LibreUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app.terminate()
        app = nil
        super.tearDown()
    }

    func testClickOnSearchButtonBeforeTypingQuery() {
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .searchField).element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Erro!"].scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func testTypeClickOnSearchButtonButFoundNoMatches() {
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .searchField).element.tap()
        
        app/*@START_MENU_TOKEN@*/.keys["T"]/*[[".keyboards.keys[\"T\"]",".keys[\"T\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.keys["r"].tap()
        app.keys["r"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Erro!"].scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func testTypeClickOnSearchButtonAndListMatches() {
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .searchField).element.tap()
        app.keys["B"].tap()
        app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.keys["l"].tap()
        app.keys["a"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"buscar\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Bola Led Audioritmica Rgb Esfera Dj Sonido Usb Sd Pendrive"]/*[[".cells.staticTexts[\"Bola Led Audioritmica Rgb Esfera Dj Sonido Usb Sd Pendrive\"]",".staticTexts[\"Bola Led Audioritmica Rgb Esfera Dj Sonido Usb Sd Pendrive\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
    }
}
