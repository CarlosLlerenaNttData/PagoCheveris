//
//  PaymentCategory.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 8/07/22.
//

import Foundation
import PagoCheverisUI

enum PaymentCategory: Int, Codable, PCTabItem {
    case servicesPay = 1
    case institutionPayment
    case creditCard
    case SUNAT
    case rechargeCell
    
    var title: String {
        switch self {
        case .servicesPay:
            return PaymentsStrings.Home.servicesPay
        case .institutionPayment:
            return PaymentsStrings.Home.institutionPayment
        case .creditCard:
            return PaymentsStrings.Home.creditCard
        case .SUNAT:
            return PaymentsStrings.Home.SUNAT
        case .rechargeCell:
            return PaymentsStrings.Home.rechargeCell
        }
    }
}
