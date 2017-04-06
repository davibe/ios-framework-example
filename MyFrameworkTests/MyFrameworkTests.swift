//
//  MyFrameworkTests.swift
//  MyFrameworkTests
//
//  Created by Davide Bertola on 03/04/2017.
//  Copyright © 2017 Davide Bertola. All rights reserved.
//

import XCTest
@testable import MyFramework

class MyFrameworkTests: XCTestCase {
    public var framework:MyFramework? = nil
    
    override func setUp() {
        super.setUp()
        self.framework = MyFramework()
    }
    
    override func tearDown() {
        self.framework = nil
        super.tearDown()
    }
    
    func testDoSomething() {
        let result:Bool = self.framework!.doSomething()
        XCTAssert(self.framework!.optionalString != nil)
        XCTAssert(result)
    }
    
    func testDoReadResource() {
        let result = self.framework!.doReadResource()
        XCTAssert(result != nil)
    }
    
    func testDoExecuteJavascript() {
        let result = self.framework!.doExecuteJavascript()
        XCTAssert(result != nil)
    }
    
    func testDoObserveValue() {
        
        let expectation = XCTestExpectation(description: "observed value changes correctly")
        
        let result = self.framework!.doObserveValue { (before, after) in
            XCTAssert(before == 0)
            XCTAssert(after == 4)
            expectation.fulfill()
        }
        XCTAssert(result == 4)
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
