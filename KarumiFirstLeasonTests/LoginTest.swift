//
//  LoginTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import XCTest
@testable import KarumiFirstLeason

class LoginTest: XCTestCase {

    let interactor = Login()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReturnFalseIfTheCredentialsAreWrong() {
        
        let result = interactor.login(user: "asd", pass: "asda")
        XCTAssertEqual(false, result)
    }
    
    func testReturnTrueIfTheCredentialsAreCorrect() {
        
        let result = interactor.login(user: "galicia", pass: "lloviendo")
        XCTAssertEqual(true, result)
    }

}
