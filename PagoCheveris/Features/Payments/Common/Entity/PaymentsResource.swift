//
//  PaymentsResource.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import PagoCheverisNetworking

enum PaymentsResource: Resource {

    case payments

    var resource: (method: HTTPMethod, route: String) {
        switch self {
        case .payments:
            return (.post, "/payments")
        }
    }
}
