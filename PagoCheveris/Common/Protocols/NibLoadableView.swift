//
//  NibLoadableView.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 8/07/22.
//

import UIKit

protocol NibLoadableView: AnyObject {
    
    static var nib: UINib { get }
}

extension NibLoadableView {
    
    /**
     Adds the functionality of getting the Nib Name using the property nibName
     
     ### Usage Example: ###
     ````
     extension ViewCell: NibLoadableView {}
     
     ViewCell.nibName
     ````
     */
    static var nibName: String {
        String(describing: self)
    }
    
    //Instantiate a nib with the same name as the class and located in the same bundle as the class
    static var nib: UINib {
        UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}

extension NibLoadableView where Self: UIView {
    
    /**
     Returns a UIView Instantiated from a Nib
     
     ### Usage Example: ###
     ````
     extension NameOfView: NibLoadableView {}
     
     let view = NameOfClass.loadFromNib()
     ````
     */
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? Self else {
            fatalError("The nib \(nib) whas not able to load successfully")
        }
        
        return view
    }
}
