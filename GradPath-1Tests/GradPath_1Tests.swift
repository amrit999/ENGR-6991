//
//  GradPath_1Tests.swift
//  GradPath-1Tests
//
//  Created by Amrit Kalsi on 2020-11-02.
//

import XCTest
@testable import GradPath_1

class GradPath_1Tests: XCTestCase {
    
    var sut: ViewController!
    var a: LevelViewController!
    var b: KeywordViewController!
    var c: CourseTableViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "vc") as? ViewController
        sut.loadViewIfNeeded()
        a = storyboard.instantiateViewController(withIdentifier: "Level_vc") as? LevelViewController
        a.loadViewIfNeeded()
        b = storyboard.instantiateViewController(withIdentifier: "Keyword_vc") as? KeywordViewController
        b.loadViewIfNeeded()
        c = storyboard.instantiateViewController(withIdentifier: "Course_vc") as? CourseTableViewController
        c.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        a = nil
        b = nil
        c = nil
    }
    
    func testIfLoginButtonHasActionAssigned() {
        let buttonLogin: UIButton = sut.loginButton
        
        guard let loginButtonActions = buttonLogin.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(loginButtonActions.contains("LoginTapped:"))
    }
    
    func testIfSignUpButtonHasActionAssigned() {
        let buttonSignup: UIButton = sut.signupButton
        
        guard let signUpButtonActions = buttonSignup.actions(forTarget: sut, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(signUpButtonActions.contains("SignupTapped:"))
    }
    
    func testIfLevelButtonHasActionAssigned() {
        let buttonLevel: UIButton = a.graduateButton
        
        guard let buttonLevelActions = buttonLevel.actions(forTarget: a, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(buttonLevelActions.contains("graduate_tapped:"))
    }
    
    func testIfKeywordButtonHasActionAssigned() {
        let buttonKeyword: UIButton = b.softwareButton
        
        guard let softwareButtonActions = buttonKeyword.actions(forTarget: b, forControlEvent: .touchUpInside) else {
            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
            return
        }
        XCTAssertTrue(softwareButtonActions.contains("key_4_tapped:"))
    }
    
//    func testIfSaveButtonHasActionAssigned() {
//        let buttonSave: UIButton = c.saveButton
//        
//        guard let saveButtonActions = buttonSave.actions(forTarget: c, forControlEvent: .touchUpInside) else {
//            XCTFail("UIButton does not have actions assigned for Control Event .touchUpInside")
//            return
//        }
//        XCTAssertTrue(saveButtonActions.contains("Save_Tapped:"))
//    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
