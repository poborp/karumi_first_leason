//
//  LogoutTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

@testable import KarumiFirstLeason
import XCTest

class LogoutTest: XCTestCase {
    
    func testReturnTrueIfTheDateIsEven() {
        
        let expectation = XCTestExpectation(description: "expectation")
        
        let interactor = Logout(clock: FixedTimeClock(timestamp: 1573570986))
        interactor.logout { (result) in
            switch result {
            case .success:
                break
            case .failure(_):
                XCTFail()
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testReturnFalseIfTheDateIsOdd() {

        let expectation = XCTestExpectation(description: "expectation")
        
        let interactor = Logout(clock: FixedTimeClock(timestamp: 1573570987))
        interactor.logout { (result) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(LogoutError.date, error)
            }
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }

}
