//
//  PaymentRequest.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

struct PaymentRequest: Encodable {

    let sessionId: String
    let paymentCategory: PaymentCategory?
    
    init(sessionId: String, paymentCategory: PaymentCategory? = nil){
        self.sessionId = sessionId
        self.paymentCategory = paymentCategory
    }
}
