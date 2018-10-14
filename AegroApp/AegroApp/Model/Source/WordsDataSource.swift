//
//  WordsDataSource.swift
//  AegroApp
//
//  Created by Gabriel Conte on 13/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation
import RealmSwift

class WordsDataSource: NSObject{
    
    let realm = try! Realm()
    
    /// Add new word to the database
    func saveNewWord(word: String, in realm: Realm = try! Realm(), completion: ()-> ()) {
        let item = Word(id: word, text: word)
        
        try! realm.write {
            realm.add(item, update: true)
            completion()
        }
    }
    
    
    func retrieveAll(in realm: Realm = try! Realm()) -> Results<Word> {
        return realm.objects(Word.self)
            .sorted(byKeyPath: Word
                .Property.isCompleted.rawValue)
    }
    
    func getWord(key: String, in realm: Realm = try! Realm()) -> Word? {
        return realm.object(ofType: Word.self, forPrimaryKey: key)
    }
    
    func toggleCompleted(word: Word) {
        try! realm.write {
            word.isCompleted = !(word.isCompleted)
        }
    }
    
    func delete(word: Word, in realm: Realm = try! Realm()) {
        try! realm.write {
            if let obj = (realm.object(ofType: Word.self, forPrimaryKey: word.id)){
                realm.delete(obj)
            }
        }
    }
    
    func cleanDatabase(in realm: Realm = try! Realm(), completion: () -> ()) {
        try! realm.write {
            realm.deleteAll()
            completion()
        }
    }
    
}
