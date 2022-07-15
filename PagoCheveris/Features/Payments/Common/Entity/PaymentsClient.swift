//
//  PaymentsClient.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import Combine
import PagoCheverisNetworking

protocol PaymentsClientProvider {
    func paymentList(parameters: PaymentRequest) -> AnyPublisher<PaymentResponse, NetworkingError>
    func paymentPerform(parameters: PaymentPerformRequest) ->  AnyPublisher<EmptyResponse, NetworkingError>
    func active(parameters: PaymentActiveRequest) ->  AnyPublisher<EmptyResponse, NetworkingError>
}

final class PaymentsClient: RestClient, PaymentsClientProvider {
    
    func paymentList(parameters: PaymentRequest) -> AnyPublisher<PaymentResponse, NetworkingError> {
        request(resource: PaymentsResource.paymentsList , parameters: parameters.json, type: PaymentResponse.self, errorType: ErrorResponse.self)
    }
    
    func paymentPerform(parameters: PaymentPerformRequest) -> AnyPublisher<EmptyResponse, NetworkingError> {
        request(resource: PaymentsResource.paymentsPerform , parameters: parameters.json, type: EmptyResponse.self, errorType: ErrorResponse.self)
    }
    
    func active(parameters: PaymentActiveRequest) -> AnyPublisher<EmptyResponse, NetworkingError> {
        request(resource: PaymentsResource.paymentsActive , parameters: parameters.json, type: EmptyResponse.self, errorType: ErrorResponse.self)
    }
    
}
