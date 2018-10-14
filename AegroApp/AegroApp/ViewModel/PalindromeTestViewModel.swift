//
//  PalindromeTestViewModel.swift
//  AegroApp
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

protocol DataUpdate {
    func loadTable()
}

class PalindromeTestViewModel: NSObject {
    
    private lazy var dataSource = WordsDataSource()
    
    lazy var palindromeResultText: Box<String> = Box("")
    
    lazy var palindromeWords: [String?] = []
    
    var delegate: DataUpdate?
    
    override init() {
        super.init()
        palindromeWords = getPalindromeWords()
    }
    
    /// Given a word, returns a boolean that indicates if it is palindrome or not
    func isPalindrome(_ word: String) -> Bool{
        
        if word == ""{
            self.palindromeResultText.value = "Empty :|"
            return false
        }
        
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
        
        if isPalindrome(word) && !palindromeWords.contains(word){
            dataSource.saveNewWord(word: word) {
                palindromeWords.append(word)
                delegate?.loadTable()
            }
        }
    }
    
    func getPalindromeWords() -> [String]{
        let words = Array(dataSource.retrieveAll()).map({$0.text})
        return words
    }
    
    
    func getWordAt(index: Int) -> String{
        let isValid = palindromeWords.indices.contains(index)
        if isValid{
            return palindromeWords[index]!
        }else{
            return ""
        }
    }
    
    func deleteWordAt(index: Int){
        let isValid = palindromeWords.indices.contains(index)
        if !isValid{
            return
        }
        guard let text = palindromeWords[index] else{
            return
        }
        let word = Word(id: text, text: text)
        dataSource.delete(word: word)
        palindromeWords.remove(at: index)
        delegate?.loadTable()
    }
    
    func cleanWords(){
        dataSource.cleanDatabase(){
            palindromeWords = []
            delegate?.loadTable()
        }
    }
}
