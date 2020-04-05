//
//  DogYearsTests.swift
//  DogYearsTests
//
//  Created by Igor Clemente on 02/04/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import XCTest
@testable import DogYears

class DogYearsTests: XCTestCase {

    let calc = Calculator()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAdd() {
        let result = calc.evaluate(op: "+", arg1: 2.0, arg2: 9.0)
        XCTAssert(result == 11.0, "Calculator add operation failed")
    }
    
    func testSub() {
        let result = calc.evaluate(op: "-", arg1: 9, arg2: 2)
        XCTAssert(result == 7, "Calculator sub operation failed")
    }
    
    func testDisplayResult() {
        let res1 = calc.evaluate(op: "+", arg1: 2.0, arg2: 2.0)
        let res2 = calc.result
        XCTAssert(res1 == res2, "Calculator displayed result does not match calculation result")
    }

    func testDisplayClear() {
        let res1 = calc.evaluate(op: "+", arg1: 2.0, arg2: 5.0)
        let res2 = calc.result
        
        XCTAssert(res1 == res2, "Calculator value did not match result in clear operation test")
        
        calc.clear()
        
        let res3 = calc.result
        XCTAssert(res3 != res2 && res3 == 0.0, "Calculator clear operation failed")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
