//
//  WordsListManipulationViewModelTests.swift
//  AegroAppTests
//
//  Created by Gabriel Conte on 14/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import XCTest

@testable import AegroApp

class WordsListViewModelTests: XCTestCase {

    var viewModel: PalindromeTestViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = PalindromeTestViewModel()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testAddNewWord(){
        
        viewModel.palindromeWords = []
        
        viewModel.saveNewPalindromeWord("arara")
        viewModel.saveNewPalindromeWord("lalal")
        
        XCTAssert(viewModel.palindromeWords.count == 2, "palindrome words is returning the wrong count")
        XCTAssert(viewModel.palindromeWords[0] == "arara")
        XCTAssert(viewModel.palindromeWords[1] == "lalal")
    }
    
    func testRemoveWord(){
        
        viewModel.palindromeWords = ["arara", "blaalb", "lol", "ccccc"]
    
        viewModel.deleteWordAt(index: 1)
        
        XCTAssert(viewModel.palindromeWords.count == 3, "palindrome words is returning the wrong count")
        XCTAssert(viewModel.palindromeWords[1] == "lol")
        XCTAssert(viewModel.palindromeWords[2] == "ccccc")
        
        viewModel.deleteWordAt(index: 3)
        
        XCTAssert(viewModel.palindromeWords.count == 3, "palindrome words is returning the wrong count")
        XCTAssert(viewModel.palindromeWords[1] == "lol")
        XCTAssert(viewModel.palindromeWords[2] == "ccccc")
    }
    
    func testGetWordAtIndex(){
        
        viewModel.palindromeWords = ["arara", "blaalb", "lol"]
        
        let word1 = viewModel.getWordAt(index: 0)
        let word2 = viewModel.getWordAt(index: 1)
        let word3 = viewModel.getWordAt(index: 2)
        
        XCTAssert(word1 == "arara")
        XCTAssert(word2 == "blaalb")
        XCTAssert(word3 == "lol")
    }
    
    func testCleanWords(){
        
        viewModel.palindromeWords = ["arara", "blaalb", "lol"]
        
        viewModel.cleanWords()
        
        XCTAssert(viewModel.palindromeWords.count == 0)
    }
}
