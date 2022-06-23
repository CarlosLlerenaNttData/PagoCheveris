//
//  UIColor+Extensions.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 22/06/22.
//

import Foundation
import UIKit

extension UIColor {
    
    public convenience init(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        self.init()
    }
    
    static func loadColor(named: String) -> UIColor {
        guard let color = UIColor(named: named, in: Bundle.module, compatibleWith: nil) else { abort() }
        
        return color
    }
}
