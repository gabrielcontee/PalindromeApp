//
//  UIView.swift
//  AegroApp
//
//  Created by Gabriel Conte on 14/10/18.
//  Copyright © 2018 Gabriel Conte. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

