//
//  UIStoryboard+Storyboards.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

extension UIStoryboard {
    
    enum Storyboard: String {
    
        case main
        
        var filename: String {
            let firstLetter = rawValue.prefix(1)
            let camelCaseStoryboardName = firstLetter.uppercased() + rawValue.suffix(rawValue.count - 1)
            return camelCaseStoryboardName
        }
    }
    
    // MARK: - Class Functions
    
    /**
     Creates and returns a storyboard object for the specified enum. It uses the Enum value with the first letter capitalized as the identifier
     
     ### Usage Example: ###
     ````
     UIStoryboard.storyboard(.main)
     
     ````
     */
    static func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    
    static func instantiateInitialViewController(of storyboard: Storyboard, bundle: Bundle? = nil) -> UIViewController {
        let storyBoard = UIStoryboard.storyboard(storyboard)
        let viewController = storyBoard.instantiateInitialViewController()
        
        return viewController!
    }
}
