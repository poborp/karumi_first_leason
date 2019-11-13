//
//  LoginPresenterTest.swift
//  KarumiFirstLeasonTests
//
//  Created by Jacobo Rodriguez on 12/11/19.
//  Copyright © 2019 Jacobo Rodriguez. All rights reserved.
//

@testable import KarumiFirstLeason
import XCTest
import Nimble

class LoginPresenterTest: XCTestCase {
    
    func testLoginWithCorrectCredentials() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(), view: view)
        presenter.login(user: "galicia", pass: "lloviendo")
        
        expect(view.hideLogInFormCalled).toEventually(beTrue())
        expect(view.showLogOutFormCalled).toEventually(beTrue())
    }
    
    func testLoginWithWrongCredentials() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(), view: view)
        presenter.login(user: "asdasd", pass: "asdasd")
        
        expect(view.showErrorCalled).toEventually(beTrue())
    }
    
    func testReturnTrueIfLogoutDateIsEven() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(clock: FixedTimeClock(timestamp: 1573570986)), view: view)
        presenter.logout()
        
        expect(view.hideLogOutFormCalled).toEventually(beTrue())
        expect(view.showLogInFormCalled).toEventually(beTrue())
    }
    
    func testReturnErrorIfLogoutDateIsOdd() {
        
        let view = MockLoginViewController()
        let presenter = LoginPresenter(loginInteractor: Login(), logoutInteractor: Logout(clock: FixedTimeClock(timestamp: 1573570987)), view: view)
        presenter.logout()
        
        expect(view.showErrorCalled).toEventually(beTrue())
    }
    
}

private class MockLoginViewController: LoginViewProtocol {
    
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
