//
//  RealmWordPersistenceTests.swift
//  AegroAppTests
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

@testable import AegroApp

class RealmWordPersistenceTests: BaseSpec {

    let dataSource = WordsDataSource()
    let realm = try! Realm()
    
    override func setUp() {
        super.setUp()
        
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = "database A"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func spec() {
        super.spec()
        
        let palindromeString1 = "aNa"
        let palindromeString2 = "arara"
        
        describe("CRUD operations") {
            describe("Create") {
                it("saves object to database correctly") {
                    
                    self.dataSource.saveNewWord(word: palindromeString1)
                    
                    let wordFromDatabase = self.realm.objects(Word.self).last
                    expect(wordFromDatabase?.text) == palindromeString1
                }
            }
            
            describe("Read") {
                beforeEach {
                    self.dataSource.saveNewWord(word: palindromeString1)
                    self.dataSource.saveNewWord(word: palindromeString2)
                }
                
                describe("retrieving all objects") {
                    it("returns all persons") {
                        let words = self.dataSource.retrieveAll()
                        expect(words.count) == 2
                        expect(words[0].text) == "aNa"
                        expect(words[1].text) == "arara"
                    }
                }
                
                describe("filtering") {
                    it("returns filtered results") {
                        let words = self.dataSource.retrieveAll()
                        expect(words.count) == 2
                        expect(words[0].text) == "18"
                        expect(words[1].text) == "19"
                    }
                }
                
//                describe("limiting results") {
//                    it("returns limited results") {
//                        let results = dataSource.retrieveAll()
//                        expect(results.count) == 2
//                        expect(results[0].text) == "person 0"
//                        expect(results[1].text) == "person 1"
//                    }
//                }
            }
            
            describe("Delete") {
                it("deletes records from database") {
                    self.createWords(3)
                    let realm = try! Realm()
                    let palindromeOfBD = realm.object(ofType: Word.self, forPrimaryKey: 1)
                    self.dataSource.delete(word: palindromeOfBD!)
                    let words = self.dataSource.retrieveAll()
                    expect(words.count) == 2
                    expect(words[0].id) == "0"
                    expect(words[1].id) == "2"
                }
            }
        }
    }
}

extension RealmWordPersistenceTests {
    func createWords(_ amount: Int) {
        let realm = try! Realm()
        try! realm.write {
            for i in 0 ..< amount {
                let word = Word(id: "\(i)", text: "blabla\(i)")
                realm.add(word)
            }
        }
    }
}
