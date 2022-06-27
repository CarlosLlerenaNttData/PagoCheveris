//
//  JSONUtility.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

import Foundation
import PagoCheverisNetworking

public extension Encodable {
    
    var json: JSON? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? JSON }
    }
    
    var jsonString: String? {
        let jsonEncoder = JSONEncoder()
        
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try jsonEncoder.encode(self)
            
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}

public extension Dictionary {
    
    var jsonData: Data? {
        let data = try? JSONSerialization.data(withJSONObject: self, options: [])
        
        return data
    }
}
