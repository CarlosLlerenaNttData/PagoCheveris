//
//  RegexValidation.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import Foundation

extension String {
    
    public func isValid(regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: self)
        
        return isValid
    }
}
