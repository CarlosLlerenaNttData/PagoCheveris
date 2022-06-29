//
//  NetworkingService.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 28/06/22.
//

import PagoCheverisNetworking
import UIKit
import Foundation

final class NetworkingService {
    
    let userDefaults = UserDefaults.standard

    var configuration: ClientConfiguration! {
        return makeConfiguration()
    }
    
    // MARK: Private methods
    
    private func makeConfiguration() -> ClientConfiguration {
        let configuration = ClientConfiguration(baseURL: makeHost(),
                                                httpHeaders: makeHeaders())
        
        return configuration
    }
    
    private func makeHost() -> String {
       return Host.baseUrl
    }
    
    private func makeHeaders() -> [String: String] {
        ["Content-Type" : "application/json"]
    }
}
