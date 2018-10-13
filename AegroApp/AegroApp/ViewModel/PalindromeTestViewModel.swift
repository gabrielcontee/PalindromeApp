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
    
    lazy var palindromeWords: [String?] = []
    
    override init() {
        super.init()
        palindromeWords = getPalindromeWords()
    }
    
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
        }
    }
    
    func getPalindromeWords() -> [String]{
        let words = Array(dataSource.retrieveAll()).map({$0.text})
        return words
    }
    
    
    func getWordAt(index: Int) -> String{
        guard let word = palindromeWords[index] else{
            return ""
        }
        return word
    }
    
    func deleteWordAt(index: Int, completion: () -> ()){
        guard let text = palindromeWords[index] else{
            return
        }
        let word = Word(id: text, text: text)
        dataSource.delete(word: word) {
            completion()
        }
    }
    
    func cleanWords(completion: () -> ()){
        dataSource.cleanDatabase(){
            palindromeWords = []
            completion()
        }
    }
}
