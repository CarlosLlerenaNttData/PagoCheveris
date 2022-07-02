//
//  User.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

struct User: Codable {

    let username: String
    let name: String
    let surname: String
    let email: String
    let requiredToken: Bool

    init(username: String, name: String, surname: String, email: String, requiredToken: Bool) {
        self.username = username
        self.name = name
        self.surname = surname
        self.email = email
        self.requiredToken = requiredToken
    }
}
