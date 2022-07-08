//
//  Payment.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 7/07/22.
//

struct Payment: Codable {
    
    let id: String
    let userId: String
    let dateCharged: String
    let category: String
    let company: String
    let amount: String
    let state: String
}
