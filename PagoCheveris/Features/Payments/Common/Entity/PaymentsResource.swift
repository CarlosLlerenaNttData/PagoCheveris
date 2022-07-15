//
//  PaymentsResource.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import PagoCheverisNetworking

enum PaymentsResource: Resource {

    case paymentsList
    case paymentsPerform

    var resource: (method: HTTPMethod, route: String) {
        switch self {
        case .paymentsList:
            return (.post, "/payments")
        case .paymentsPerform:
            return (.post, "/paymentsPerform")
        }
    }
}
