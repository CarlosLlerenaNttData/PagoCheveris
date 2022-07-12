//
//  LoginResponse.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

struct LoginResponse: Decodable {

    let user: User
    let sessionId: String

    public init(user: User, sessionId: String) {
        self.user = user
        self.sessionId = sessionId
    }
}
