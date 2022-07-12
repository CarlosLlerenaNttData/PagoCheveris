//
//  PaymentsClient.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

import Combine
import PagoCheverisNetworking

protocol PaymentsClientProvider {
    func list(parameters: PaymentRequest) -> AnyPublisher<PaymentResponse, NetworkingError>
}

final class PaymentsClient: RestClient, PaymentsClientProvider {
    func list(parameters: PaymentRequest) -> AnyPublisher<PaymentResponse, NetworkingError> {
        request(resource: PaymentsResource.payments , parameters: parameters.json, type: PaymentResponse.self, errorType: ErrorResponse.self)
    }
}
