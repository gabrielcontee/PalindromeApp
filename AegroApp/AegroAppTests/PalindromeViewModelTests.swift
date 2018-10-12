//
//  AegroAppTests.swift
//  AegroAppTests
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest
@testable import AegroApp

class PalindromeViewModelTests: XCTestCase {
    
    var viewModel: PalindromeTestViewModel!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = PalindromeTestViewModel()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    func testPalindromeWord() {
        
        let firstPalindrome = "ana"
        
        XCTAssertTrue(viewModel.isPalindrome(word: firstPalindrome), "Ana is returing the wrong result")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
