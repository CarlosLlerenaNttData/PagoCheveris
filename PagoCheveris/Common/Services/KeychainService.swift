//
//  KeychainService.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import KeychainAccess
import Foundation

protocol KeychainServiceProvider {
    
    func save(value: String, key: String)
    func delete(key: String)
    func value(for key: String) -> String?
}

final class KeychainService: KeychainServiceProvider {
    
    enum Keys {
        
        static let username = "username"
        static let password = "password"
    }
    
    static let shared = KeychainService()
    
    private let keychain: Keychain
    
    private init() {
        keychain = Keychain()
    }
    
    // MARK: Public methods
    
    func save(value: String, key: String) {
        keychain[key] = value
    }
    
    func delete(key: String) {
        keychain[key] = nil
    }
    
    func value(for key: String) -> String? {
        keychain[key]
    }
}
