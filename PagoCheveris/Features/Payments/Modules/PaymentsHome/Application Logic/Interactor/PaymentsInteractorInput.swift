//
//  PaymentsInteractorInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol PaymentsInteractorInput {
    func getPaymentsList(category: PaymentCategory?, order: PaymentListOrder)
    func performPayment(for payments: [Payment])
    func activePayment(for paymentId: String)
}
