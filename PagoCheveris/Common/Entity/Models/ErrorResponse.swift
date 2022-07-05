//
//  Error.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 3/07/22.
//

struct ErrorResponse: Codable {
    
    let title: String
    let message: String

    public init(title: String, message: String) {
        self.title = title
        self.message = message
    }
}
