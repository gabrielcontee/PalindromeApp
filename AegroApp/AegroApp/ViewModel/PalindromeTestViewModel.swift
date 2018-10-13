//
//  PalindromeTestViewModel.swift
//  AegroApp
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class PalindromeTestViewModel: NSObject {
    
    private lazy var dataSource = WordsDataSource()
    
    lazy var palindromeResultText: Box<String> = Box("")
    
    /// Given a word, returns a boolean that indicates if it is palindrome or not
    func isPalindrome(_ word: String) -> Bool{
        
        // uppercase the word and remove any accent for future comparision
        let uppercasedWord = word.uppercased().folding(options: .diacriticInsensitive, locale: .current)
        
        let reversedWord = String(uppercasedWord.reversed())
        
        if uppercasedWord == reversedWord {
            self.palindromeResultText.value = "Yes :)"
            return true
        } else {
            self.palindromeResultText.value = "No :("
            return false
        }
    }
    
    func saveNewPalindromeWord(_ word: String){
        
        if isPalindrome(word){
            dataSource.saveNewWord(word: word)
            print("salvou!")
            print(dataSource.retrieveAll())
        }
    }
}
