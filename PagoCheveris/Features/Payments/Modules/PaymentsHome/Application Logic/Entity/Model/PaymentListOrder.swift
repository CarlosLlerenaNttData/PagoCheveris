//
//  PaymentListOrder.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 15/07/22.
//

import PagoCheverisUI

enum PaymentListOrder: Int, Codable, PCPanModalOption {
    case descendingAmount
    case ascendingAmount
    case descendingDate
    case ascendingDate
    
    var title: String {
        switch self {
        case .descendingAmount:
            return PaymentsStrings.Home.descendingAmount
        case .ascendingAmount:
            return PaymentsStrings.Home.ascendingAmount
        case .descendingDate:
            return PaymentsStrings.Home.descendingDate
        case .ascendingDate:
            return PaymentsStrings.Home.ascendingDate
        }
    }
}
