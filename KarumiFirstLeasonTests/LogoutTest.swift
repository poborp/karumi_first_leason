//
//  LogoutTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import XCTest
@testable import KarumiFirstLeason

class LogoutTest: XCTestCase {
    
    func testReturnTrueIfTheDateIsEven() {
        
        let interactor = Logout(clock: FixedTimeClock(timestamp: 1573570986))
        let result = interactor.logout()
        XCTAssertEqual(true, result)
    }
    
    func testReturnFalseIfTheDateIsOdd() {
        
        let interactor = Logout(clock: FixedTimeClock(timestamp: 1573570987))
        let result = interactor.logout()
        XCTAssertEqual(false, result)
    }

}
