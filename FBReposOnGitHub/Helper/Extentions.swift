//
//  Extentions.swift
//  FBReposOnGitHub
//
//  Created by Azza on 30/01/2021.
//

import UIKit

extension UIView{
    
    // corner radius
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // border width
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    // border color
    @IBInspectable
    var borderColor: UIColor{
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

