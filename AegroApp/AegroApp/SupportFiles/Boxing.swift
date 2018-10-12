//
//  Boxing.swift
//  AegroApp
//
//  Created by Gabriel Conte on 12/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import Foundation

class Box<T> {
    
    typealias Listener = (T) -> ()
    
    var listeners: [String:Listener]
    
    var value: T {
        didSet {
            listeners.values.forEach({$0(value)})
        }
    }
    
    init(_ value: T) {
        self.value = value
        self.listeners = [String:Listener]()
    }
    
    func bind(key: String, listener: @escaping Listener) {
        listeners[key] = (listener)
        listener(value)
    }
    
    func removeBind(key: String) {
        if listeners.keys.contains(key) {
            listeners.removeValue(forKey: key)
        }
    }
}
