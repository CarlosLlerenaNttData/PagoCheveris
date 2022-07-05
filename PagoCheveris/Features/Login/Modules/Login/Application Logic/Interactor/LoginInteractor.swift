//
//  LoginInteractor.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation
import Combine
import PagoCheverisNetworking

class LoginInteractor: LoginInteractorInput {
    
    weak var output: LoginInteractorOutput!
    lazy var networkingService: NetworkingService = NetworkingService()
    var keychainService: KeychainServiceProvider = KeychainService.shared
    lazy var loginClient: LoginClientProvider = LoginClient(configuration: NetworkingService().configuration)
    var cancellables: Set<AnyCancellable> = []
    
    func login(username: String, password: String) {
        
        let parameters = LoginRequest(username: username, password: password)
        loginClient.login(parameters: parameters)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let networkingError as NetworkingError):
                    switch networkingError {
                    case .apiError(error: let error as ErrorResponse):
                        self?.output.didFailLogin(title: error.title, message: error.message)
                    case .notConnectionInternet(let error):
                        self?.output.didFailLogin(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageInternetError)
                    case .unexpectedError(_):
                        self?.output.didFailLogin(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    default:
                        self?.output.didFailLogin(title: CommonStrings.alertTitleGenericError, message: CommonStrings.alertMessageGenericError)
                    }
                default:
                    break
                }
            }, receiveValue: { [weak self] response in
                let user = response.user
                self?.output.didLogin(user: user)
            }).store(in: &cancellables)
    }
    
    func loadCredentials() {
        guard let username = keychainService.value(for: KeychainService.Keys.username),
              let password =  keychainService.value(for: KeychainService.Keys.password)
        else { return }
        
        output.didLoadCredentials(username: username, password: password)
    }
    
    func saveCredentials(username: String, password: String) {
        keychainService.save(value: username, key: KeychainService.Keys.username)
        keychainService.save(value: password, key: KeychainService.Keys.password)
    }
    
    func deleteUserCredentials() {
        keychainService.delete(key: KeychainService.Keys.username)
        keychainService.delete(key: KeychainService.Keys.password)
    }
}
