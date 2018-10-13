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
    @discardableResult func saveNewWord(word: String, in realm: Realm = try! Realm()) -> Word {
        let item = Word(word)
        try! realm.write {
            realm.add(item)
        }
        return item
    }
    
    func retrieveAll(in realm: Realm = try! Realm()) -> Results<Word> {
        return realm.objects(Word.self)
            .sorted(byKeyPath: Word
                .Property.isCompleted.rawValue)
    }
    
    func toggleCompleted(word: Word) {
        try! realm.write {
            word.isCompleted = !(word.isCompleted)
        }
    }
    
    func delete(word: Word) {
        try! realm.write {
            realm.delete(word)
        }
    }
    
    //    try! realm.object(ofType: Word.self(), forPrimaryKey: <#T##KeyType#>)
    //
    //
    //    let theDog = realm.objects(Dog.self).filter("age == 1").first
    //    try! realm.write {
    //    theDog!.age = 3
    //    }
    
}
