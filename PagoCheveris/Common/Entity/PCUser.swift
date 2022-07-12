//
//  PCUser.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

final class PCUser {
    
    static var user: User?
    static var shouldValidateToken = true
    
    static func logout() {
        user = nil
        shouldValidateToken = true
    }
}
