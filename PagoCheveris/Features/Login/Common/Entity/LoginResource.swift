//
//  LoginResource.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

import PagoCheverisNetworking

enum LoginResource: Resource {

    case login

    var resource: (method: HTTPMethod, route: String) {
        switch self {
        case .login:
            return (.post, "/login")
        }
    }
}
