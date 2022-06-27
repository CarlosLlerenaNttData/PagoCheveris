//
//  User.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

struct User: Codable {
    
    let userName: String
    let email: String
    let sessionId: String
    let state: Int

    init(userName: String, email: String, sessionId: String, state: Int) {
        self.userName = userName
        self.email = email
        self.sessionId = sessionId
        self.state = state
    }
}
