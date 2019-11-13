//
//  LoginTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

@testable import KarumiFirstLeason
import XCTest
import Nimble

class LoginTest: XCTestCase {

    let interactor = Login()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReturnFalseIfTheCredentialsAreWrong() {
        
        let expectation = XCTestExpectation(description: "expectation")
        
        interactor.login(user: "asd", pass: "asda")  { (result) in
            switch result {
            case .success:
                break
            case .failure(let error):
                XCTAssertEqual(LoginError.error, error)
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    func testReturnTrueIfTheCredentialsAreCorrect() {
        
        let expectation = XCTestExpectation(description: "expectation")
        
        interactor.login(user: "galicia", pass: "lloviendo") { (result) in
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

}
