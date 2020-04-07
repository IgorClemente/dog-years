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
    
    var resData: Data? = nil
    
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
    
    /**
     
    func testLoadInfoView() {
        let st = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        XCTAssertNotNil(st , "Could not instantiate storyboard for Info View content loading")
        
        guard let vc = st.instantiateViewController(identifier: "InformationView") as? InfoViewController else {
            XCTAssert(false, "Could not instantiate storyboard for Info View content loading")
            return
        }
        
        _ = vc.view
        
        guard let txt = vc.txtInfo?.text else {
            XCTAssert(false, "Could not get initial text content for Info View content loading")
            return
        }
        
        vc.loadContent()
        
        let pred = NSPredicate(format: "text != %@", txt)
        let exp = expectation(for: pred, evaluatedWith: vc.txtInfo, handler: nil)
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
        XCTAssert(result == XCTWaiter.Result.completed, "Loading content for Info View did not change")
    }
    
    **/
    
    /**
    
    func testLoadInfoView2() {
        let url = "https://raw.githubusercontent.com/FahimF/Test/master/DogYears-Info.rtf"
        HTTPClient.shared.get(url: url) { (data, error) in
            XCTAssertNil(error, "There was an error loading the InfoView content")
            XCTAssertNotNil(data, "Not data was received from the server for InfoView content")
        }
    }
    
    **/
    
    func testInfoLoading() {
        let url = "https://raw.githubusercontent.com/FahimF/Test/master/DogYears-Info.rtf"
        HTTPClient.shared.get(url: url) { (data, error) in
            self.resData = data
        }
        
        let pred = NSPredicate(format: "resData != nil")
        let exp = expectation(for: pred, evaluatedWith: self, handler: nil)
        let res = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
        if res == XCTWaiter.Result.completed {
            XCTAssertNotNil(resData, "No data recived from the server for InfoView content")
        } else {
            XCTAssert(false, "The call to get the URL ran into some other error")
        }
    }
 
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
