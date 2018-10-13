//
//  Word.swift
//  AegroApp
//
//  Created by Gabriel Conte on 13/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation
import RealmSwift

class Word: Object {

    enum Property: String {
        case id, text, isCompleted
    }
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var text = ""
    @objc dynamic var isCompleted = false
    
    override static func primaryKey() -> String? {
        return Word.Property.id.rawValue
    }
    
    convenience init(id: String = UUID().uuidString, text: String = "") {
        self.init()
        self.id = id
        self.text = text
    }
    
    convenience init(_ text: String) {
        self.init()
        self.text = text
    }
}
