//
//  LoginPresenterTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

import XCTest
@testable import KarumiFirstLeason

class LoginPresenterTest: XCTestCase {
    
    func testLoginWithCorrectCredentials() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(), view: view)
        presenter.login(user: "galicia", pass: "lloviendo")
        
        XCTAssertEqual(true, view.hideLogInFormCalled)
        XCTAssertEqual(true, view.showLogOutFormCalled)
    }
    
    func testLoginWithWrongCredentials() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(), view: view)
        presenter.login(user: "asdasd", pass: "asdasd")
        
        XCTAssertEqual(true, view.showErrorCalled)
    }
    
    func testReturnTrueIfLogoutDateIsEven() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(clock: FixedTimeClock(timestamp: 1573570986)), view: view)
        presenter.logout()
        
        XCTAssertEqual(true, view.hideLogOutFormCalled)
        XCTAssertEqual(true, view.showLogInFormCalled)
        XCTAssertEqual(false, view.showErrorCalled)
    }
    
    func testReturnErrorIfLogoutDateIsOdd() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(clock: FixedTimeClock(timestamp: 1573570987)), view: view)
        presenter.logout()
        
        XCTAssertEqual(true, view.showErrorCalled)
    }
    
    // MARK: - Private
    
    private func givenPresenter(loginInteractor: Login = Login(),
                                logoutInteractor: Logout = Logout()) -> LoginPresenter {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: loginInteractor, logoutInteractor: logoutInteractor, view: view)
        return presenter
    }
    
}

class MockLoginViewController: LoginViewProtocol {
    
    var hideLogInFormCalled: Bool = false
    var hideLogOutFormCalled: Bool = false
    var showLogInFormCalled: Bool = false
    var showLogOutFormCalled: Bool = false
    var showErrorCalled: Bool = false
    
    func hideLogInForm() {
        hideLogInFormCalled = true
    }
    
    func hideLogOutForm() {
        hideLogOutFormCalled = true
    }
    
    func showLogInForm() {
        showLogInFormCalled = true
    }
    
    func showLogOutForm() {
        showLogOutFormCalled = true
    }
    
    func showError(message: String) {
        showErrorCalled = true
    }
    
}
