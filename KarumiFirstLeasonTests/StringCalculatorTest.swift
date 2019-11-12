//
//  StringCalculatorTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import XCTest
@testable import KarumiFirstLeason

class StringCalculatorTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here.
    }
    
    override func tearDown() {
        // Put teardown code here.
    }
    
    // MARK: - All scenarios in one method
    
    private let scenarios: [(input: String, expectedResult: Float)] = [("", 0),
                                                                       ("0", 0),
                                                                       ("2", 2),
                                                                       ("1,3", 4),
                                                                       ("1,3", 4),
                                                                       ("1, 3,4", 8),
                                                                       ("1,3,4,6", 14),
                                                                       ("1,3\n4,6", 14)]
    
    func testAllScenarios() {
        
        scenarios.forEach({ evaluateStringCalculator(input: $0.input, expectedResult: $0.expectedResult) })
    }
    
    // MARK: - Scenarios in saparate functions
    
    func testReturnZeroIfTheStringIsEmpty() {
        
        evaluateStringCalculator(input: "", expectedResult: 0)
    }
    
    func testReturnZeroIfTheStringIsZero() {
        
        evaluateStringCalculator(input: "0", expectedResult: 0)
    }
    
    func testReturnValueIfTheStringHasOneValue() {
        
        evaluateStringCalculator(input: "2", expectedResult: 2)
    }
    
    func testReturnSumIfTheStringHasTwoValues() {
        
        evaluateStringCalculator(input: "1,3", expectedResult: 4)
    }
    
    func testReturnSumIfTheStringHasThreeValues() {
        
        evaluateStringCalculator(input: "1,3,4", expectedResult: 8)
    }
    
    func testReturnSumIfTheStringHasFourValues() {
        
        evaluateStringCalculator(input: "1,3,4,5", expectedResult: 13)
    }
    
    func testReturnSumIfTheStringHasFourValuesWithBreakline() {
        
        evaluateStringCalculator(input: "1,3\n4,5", expectedResult: 13)
    }
    
    // MARK: - Private
    
    private func evaluateStringCalculator(input: String, expectedResult: Float) {
        
        let stringCalculator = StringCalculator()
        let result = stringCalculator.add(number: input)
        XCTAssertEqual(expectedResult, result)
    }

}
