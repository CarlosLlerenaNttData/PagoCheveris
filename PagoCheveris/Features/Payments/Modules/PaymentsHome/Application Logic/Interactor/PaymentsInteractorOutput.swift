//
//  PaymentsInteractorOutput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol PaymentsInteractorOutput: AnyObject {
    func didFetchPaymentsList(_ paymentsList: [Payment])
    func didFailFetchingPaymentsList(title: String, message: String)
}
