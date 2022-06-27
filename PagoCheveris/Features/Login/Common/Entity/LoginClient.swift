//
//  LoginClient.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 27/06/22.
//

import Combine
import PagoCheverisNetworking

protocol LoginClientProvider {
    func login(parameters: LoginRequest) ->  AnyPublisher<LoginResponse, Error>
}

final class LoginClient: RestClient, LoginClientProvider {
    
    func login(parameters: LoginRequest) -> AnyPublisher<LoginResponse, Error> {
        request(resource: LoginResource.login, parameters: parameters.json, headers: HTTPHeaders(), type: LoginResponse.self, errorType: LoginResponse.self)
    }
}
