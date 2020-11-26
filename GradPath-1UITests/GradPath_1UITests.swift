//
//  GradPath_1UITests.swift
//  GradPath-1UITests
//
//  Created by Amrit Kalsi on 2020-11-25.
//

import XCTest
var app: XCUIApplication!
class GradPath_1UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        super.setUp()
            continueAfterFailure = false
            app = XCUIApplication()
            app.launchArguments.append("--uitesting")
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testSignUpButtonDisplays() {
        app.launch()
        XCTAssertTrue(app.buttons["LOGIN"].exists)
        XCTAssertTrue(app.buttons["SIGNUP"].exists)
    }
    
    func testSignUpButtonShowsSignUpUi() {
        app.launch()
        app.buttons["SIGNUP"].tap()
        XCTAssertFalse(app.buttons["Sign in"].exists)
    }
    
    func testLoginButtonShowsLoginUi() {
        app.launch()
        app.buttons["LOGIN"].tap()
        XCTAssertFalse(app.buttons["Login"].exists)
    }
    
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
