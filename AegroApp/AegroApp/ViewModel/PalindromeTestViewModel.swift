//
//  PalindromeTestViewModel.swift
//  AegroApp
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class PalindromeTestViewModel: NSObject {
    
    /// Given a word, returns a boolean that indicates if it is palindrome or not
    func isPalindrome(_ word: String) -> Bool{
        
        // uppercase the word and remove any accent for future comparision
        let uppercasedWord = word.uppercased().folding(options: .diacriticInsensitive, locale: .current)
        
        let reversedWord = String(uppercasedWord.reversed())
        
        if uppercasedWord == reversedWord {
            return true
        } else {
            return false
        }
    }
}
