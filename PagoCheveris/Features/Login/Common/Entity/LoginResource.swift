//
//  LoginResource.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

import PagoCheverisNetworking

enum LoginResource: Resource {

    case login
    case logout
    case recoverPassword
    case setNewPassword
    
    var resource: (method: HTTPMethod, route: String) {
        switch self {
        case .login:
            return (.post, "/sessions/v1/signin")
        case .logout:
            return (.post, "/sessions/v1/signout")
        case .recoverPassword:
            return (.post, "/registration/v1/passwords/recovery")
        case .setNewPassword:
            return (.post, "/registration/v1/passwords/change")
        }
    }
}
