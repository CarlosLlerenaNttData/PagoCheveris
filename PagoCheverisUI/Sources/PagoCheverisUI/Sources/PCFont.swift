//
//  PCFont.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

public struct PCFont {
    
    public static let medium14 = mediumFont(size: 14.0)
    
    public static let semiBold14 = semiBoldFont(size: 14.0)
    public static let semiBold15 = semiBoldFont(size: 15.0)
    public static let semiBold16 = semiBoldFont(size: 16.0)
    public static let semiBold24 = semiBoldFont(size: 24.0)
    
    public static let bold14 = boldFont(size: 14.0)
    public static let bold15 = boldFont(size: 15.0)
    public static let bold16 = boldFont(size: 16.0)
    public static let bold17 = boldFont(size: 17.0)
    
    public static let heavy12 = heavyFont(size: 12.0)
    
    
    // MARK: Private methods
    
    private static func semiBoldFont(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    private static func boldFont(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    private static func heavyFont(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .heavy)
    }
    
    private static func mediumFont(size: CGFloat) -> UIFont {
        UIFont.systemFont(ofSize: size, weight: .medium)
    }
}
