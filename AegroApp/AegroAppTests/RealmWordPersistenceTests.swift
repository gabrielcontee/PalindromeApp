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
    let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "test"))
    
    override func setUp() {
        super.setUp()
    
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
                    
                    self.dataSource.saveNewWord(word: palindromeString1, in: self.realm, completion: {
                        let wordFromDatabase = self.realm.objects(Word.self).last
                        expect(wordFromDatabase?.text) == "aNa"
                    })
                }
            }
            
            describe("Read") {
                beforeEach {
                    self.dataSource.saveNewWord(word: palindromeString1, in: self.realm, completion: {})
                    self.dataSource.saveNewWord(word: palindromeString2, in: self.realm, completion: {})
                }
                
                describe("retrieving all objects") {
                    it("returns all persons") {
                        let words = self.dataSource.retrieveAll(in: self.realm)
                        expect(words.count) == 2
                        expect(words[0].text) == "aNa"
                        expect(words[1].text) == "arara"
                    }
                }
            }
            
            describe("Delete") {
                it("deletes records from database") {
                    self.createWords(3)
                    let realm = try! Realm()
                    let palindromeOfBD = realm.object(ofType: Word.self, forPrimaryKey: "1")
                    self.dataSource.delete(word: palindromeOfBD!)
                    let words = self.dataSource.retrieveAll(in: realm)
                    expect(words.count) == 2
                    expect(words[0].id) == "0"
                    expect(words[1].id) == "2"
                }
            }
            
            describe("Clean database") {
                it("deletes all records from database") {
                    self.dataSource.cleanDatabase(in: self.realm, completion: {
                        let words = self.dataSource.retrieveAll(in: self.realm)
                        expect(words.count) == 0
                    })
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
