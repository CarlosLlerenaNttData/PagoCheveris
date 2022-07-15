//
//  PaymentsInteractor.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Combine
import Foundation

class PaymentsInteractor: PaymentsInteractorInput {

    weak var output: PaymentsInteractorOutput!
    lazy var networkingService: NetworkingService = NetworkingService()
    lazy var paymentsClient: PaymentsClientProvider = PaymentsClient(configuration: NetworkingService().configuration)
    var cancellables: Set<AnyCancellable> = []

    func getPaymentsList(category: PaymentCategory?, order: PaymentListOrder) {
        
        guard let sessionId = SessionService.shared.sessionId else {
            output.didFailFetchingPaymentsList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
            return
        }

        let parameters = PaymentRequest(sessionId: sessionId, paymentCategory: category, order: order)
        paymentsClient.paymentList(parameters: parameters)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError):
                    switch networkingError {
                    case .apiError(error: let error as ErrorResponse):
                        self?.output.didFailFetchingPaymentsList(title: error.title, message: error.message)
                    case .notConnectionInternet(let error):
                        self?.output.didFailFetchingPaymentsList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageInternetError)
                    case .unexpectedError(_):
                        self?.output.didFailFetchingPaymentsList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    default:
                        self?.output.didFailFetchingPaymentsList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.output.didFetchPaymentsList(response.payments)
            }).store(in: &cancellables)
    }
    
    func performPayment(for payments: [Payment]) {
        guard let sessionId = SessionService.shared.sessionId else {
            output.didFailFetchingPaymentsList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
            return
        }

        let parameters = PaymentPerformRequest(sessionId: sessionId, payments: payments)
        paymentsClient.paymentPerform(parameters: parameters)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError):
                    switch networkingError {
                    case .apiError(error: let error as ErrorResponse):
                        self?.output.didFailPerformingAction(title: error.title, message: error.message)
                    case .notConnectionInternet(_):
                        self?.output.didFailPerformingAction(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageInternetError)
                    case .unexpectedError(_):
                        self?.output.didFailPerformingAction(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    default:
                        self?.output.didFailPerformingAction(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.output.didPerformAction(payments: payments)
            }).store(in: &cancellables)
    }
    
    func activePayment(for paymentId: String) {
        guard let sessionId = SessionService.shared.sessionId else {
            output.didFailFetchingPaymentsList(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
            return
        }

        let parameters = PaymentActiveRequest(sessionId: sessionId, paymentId: paymentId)
        paymentsClient.active(parameters: parameters)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError):
                    switch networkingError {
                    case .apiError(error: let error as ErrorResponse):
                        self?.output.didFailPerformingAction(title: error.title, message: error.message)
                    case .notConnectionInternet(_):
                        self?.output.didFailPerformingAction(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageInternetError)
                    case .unexpectedError(_):
                        self?.output.didFailPerformingAction(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    default:
                        self?.output.didFailPerformingAction(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                self?.output.didActivedPayment()
            }).store(in: &cancellables)
    }
    
}
