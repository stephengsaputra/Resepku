//
//  UIFontExtensions.swift
//  GloriaApp
//
//  Created by Stephen Giovanni Saputra on 12/11/22.
//

import UIKit

extension UIFont {
    
    static func largeTitle() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-Bold", size: 32) else {
            return UIFont.systemFont(ofSize: 32)
        }
        
        return customFont
    }
    
    static func heading1() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-Bold", size: 24) else {
            return UIFont.systemFont(ofSize: 24)
        }
        
        return customFont
    }
    
    static func heading2() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-Bold", size: 20) else {
            return UIFont.systemFont(ofSize: 20)
        }
        
        return customFont
    }
    
    static func heading3() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-SemiBold", size: 17) else {
            return UIFont.systemFont(ofSize: 17)
        }
        
        return customFont
    }
    
    static func bodyText() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-Medium", size: 16) else {
            return UIFont.systemFont(ofSize: 16)
        }
        
        return customFont
    }
    
    static func navigationItemButton() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-SemiBold", size: 16) else {
            return UIFont.systemFont(ofSize: 16)
        }
        
        return customFont
    }
    
    static func cellContent() -> UIFont {
        
        guard let customFont = UIFont(name: "Raleway-Bold", size: 15) else {
            return UIFont.systemFont(ofSize: 15)
        }
        
        return customFont
    }
}
