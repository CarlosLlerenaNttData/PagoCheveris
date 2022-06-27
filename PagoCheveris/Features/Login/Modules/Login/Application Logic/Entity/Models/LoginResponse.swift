//
//  LoginResponse.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

struct LoginResponse: Codable {
    
    let user: User

    public init(user: User) {
        self.user = user
    }
}
