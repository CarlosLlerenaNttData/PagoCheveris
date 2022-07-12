//
//  ReusableViewIdentifier.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 8/07/22.
//

import UIKit

/**
 Adds the functionality of a variable called reuseIdentifier to any UIView that conforms to this protocol.
 It is assumed that the reuseidentifier placed on the Storyboard has the same name as the class that is conforming to it.
 
 ### Usage Example: ###
 ````
 extension ViewCell: ReusableViewIdentifier {}
 
 ViewCell.reuseIdentifier
 ````
 */
protocol ReusableViewIdentifier: AnyObject {
    
    static var reuseIdentifier: String { get }
}

extension ReusableViewIdentifier where Self: UIView {
    
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
