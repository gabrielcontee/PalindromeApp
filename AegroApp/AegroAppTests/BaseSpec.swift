//
//  BaseSpec.swift
//  AegroAppTests
//
//  Created by Gabriel Conte on 13/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

class BaseSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        beforeSuite {
            self.useTestDatabase()
        }
        
        beforeEach {
            self.clearDatabase()
        }
    }
}

extension BaseSpec {
    
    func useTestDatabase() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
    
    func clearDatabase() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}

