//
//  RealmWordPersistenceTests.swift
//  AegroAppTests
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import RealmSwift
import XCTest

@testable import AegroApp

class RealmWordPersistenceTests: XCTestCase {

    var dataSource: WordsDataSource = WordsDataSource()
    let realm = try! Realm()
    
    override func setUp() {
        super.setUp()
        
        
    }
    
    
    override func tearDown() {
        super.tearDown()
    }
    
}
