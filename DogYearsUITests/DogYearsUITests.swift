//
//  DogYearsUITests.swift
//  DogYearsUITests
//
//  Created by Igor Clemente on 08/04/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest

class DogYearsUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        let app = XCUIApplication()
        self.app = app
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCalculatorEntry() {
        
        //let app = XCUIApplication()
        
        let display = app.staticTexts.matching(identifier: "result").firstMatch
        app.buttons["2"].tap()
        app.buttons["4"].tap()
        app.staticTexts["24"].tap()
        
        XCTAssert(display.label == "24", "The calculator display value did not change")
    }
    
    func testInformationNavigation() {
        
        let app = XCUIApplication()
        app.navigationBars["Master"].buttons["Menu"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Information"]/*[[".cells.staticTexts[\"Information\"]",".staticTexts[\"Information\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let nav = app.navigationBars["Information"]
        
        XCTAssert(nav.exists, "The information view navigation bar does not exist")
    }
    
    func testSettingsNavigation() {
        
        let app = XCUIApplication()
        app.navigationBars["Master"].buttons["Menu"].tap()
        app.tables.staticTexts["Settings"].tap()
        
        let nav = app.navigationBars["Settings"]
        
        XCTAssert(nav.exists, "The settings view navigation bar does not exist")
    }
    
    func testAboutNavigation() {
        
        let app = XCUIApplication()
        app.navigationBars["Master"].buttons["Menu"].tap()
        app.tables.staticTexts["About"].tap()
        
        let nav = app.navigationBars["About"]
        
        XCTAssert(nav.exists, "The about view navigation bar does not exist")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
