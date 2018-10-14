//
//  AegroAppUITests.swift
//  AegroAppUITests
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest

class AegroAppUITests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app.otherElements.containing(.navigationBar, identifier:"Aegro App").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.buttons["Try it!"].tap()
        app.tables["Empty list"].swipeDown()
        app.buttons["Clean"].tap()
        app.textFields["Your word here..."].tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["A"]/*[[".keyboards.keys[\"A\"]",".keys[\"A\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        
        let lKey = app/*@START_MENU_TOKEN@*/.keys["L"]/*[[".keyboards.keys[\"L\"]",".keys[\"L\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey.tap()
        
        let aKey2 = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey2.tap()
        
        let lKey2 = app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lKey2.tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards.buttons[\"Done\"]",".buttons[\"Done\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2.tables/*@START_MENU_TOKEN@*/.staticTexts["Lal"].swipeLeft()/*[[".cells.staticTexts[\"Lal\"]",".swipeDown()",".swipeLeft()",".staticTexts[\"Lal\"]"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.tables.buttons["Delete"].tap()
        app.navigationBars["Palindrome"].buttons["Aegro App"].tap()
        XCUIDevice.shared.orientation = .faceUp
        
    }

}
