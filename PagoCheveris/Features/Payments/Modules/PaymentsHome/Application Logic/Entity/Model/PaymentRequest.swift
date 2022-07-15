//
//  PaymentRequest.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

struct PaymentRequest: Encodable {

    let sessionId: String
    let paymentCategory: PaymentCategory?
    let order: PaymentListOrder
    
    init(sessionId: String, paymentCategory: PaymentCategory? = nil, order: PaymentListOrder){
        self.sessionId = sessionId
        self.paymentCategory = paymentCategory
        self.order = order
    }
}
