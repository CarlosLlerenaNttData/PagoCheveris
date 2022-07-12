//
//  LoginClient.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

import Combine
import PagoCheverisNetworking

protocol LoginClientProvider {
    func login(parameters: LoginRequest) ->  AnyPublisher<LoginResponse, NetworkingError>
}

final class LoginClient: RestClient, LoginClientProvider {
    
    func login(parameters: LoginRequest) -> AnyPublisher<LoginResponse, NetworkingError> {
        request(resource: LoginResource.login, parameters: parameters.json, type: LoginResponse.self, errorType: ErrorResponse.self)
    }
}
