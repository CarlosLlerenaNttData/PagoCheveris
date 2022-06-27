//
//  LoginRequest.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

struct LoginRequest: Codable {
    
    let username: String
    let password: String

    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
