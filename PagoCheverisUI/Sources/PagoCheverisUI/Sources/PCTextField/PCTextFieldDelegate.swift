//
//  PCTextFieldDelegate.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import Foundation

public protocol PCTextFieldDelegate: AnyObject {
    
    func textFieldDidBeginEditing(_ textField: PCTextField)
    
    func textFieldDidEndEditing(_ textField: PCTextField)
    
    func textFieldDidChange(_ textField: PCTextField)
}
