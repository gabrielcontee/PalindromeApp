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

    /// Palindrome word test function
    func testPalindromeWord() {
        
        let palindromeWord: [String] = ["ana", "ArAra", "mamam", "racificar", "RODADOR", "rír", "saiaS", "afã", "12344321", "!@!"]
        let notPalindromeWords: [String] = ["Caso", "AEGRO", "navio", "piqui", "rodando", "obJETÍVO", "etc", "1234", "@!", ""]
        
        for pWord in palindromeWord{
            XCTAssertTrue(viewModel.isPalindrome(pWord), "\(pWord) is returing the wrong result")
        }
        
        for notPWord in notPalindromeWords{
            XCTAssertFalse(viewModel.isPalindrome(notPWord), "\(notPWord) is returing the wrong result")
        }
    }
    
    /// Test binding between elements
    func testbindTests() {
        
        let expectation = self.expectation(description: "palindromeResultText")
        viewModel.palindromeResultText.bind(key: String(describing: self)) { (data) in
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual( viewModel.palindromeResultText.value, "")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
