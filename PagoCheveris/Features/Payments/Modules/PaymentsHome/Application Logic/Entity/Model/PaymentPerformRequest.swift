//
//  PaymentPerformRequest.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 15/07/22.
//

struct PaymentPerformRequest: Encodable {
    
    let sessionId: String
    let payments: [Payment]
}
