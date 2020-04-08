//
//  DogYearsPerformanceTests.swift
//  DogYearsPerformanceTests
//
//  Created by Igor Clemente on 07/04/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears

class DogYearsPerformanceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceLoadMenu() {
        var menu =  Menu()
        
        measure {
            // Set average
            menu.loadDefaultMenu()
        }
    }
}
