//
//  LoginPresenter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class LoginPresenter {

    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
}


// MARK: LoginModuleInput methods

extension LoginPresenter: LoginModuleInput {

    func initializeModule() {
    }
}


// MARK: LoginViewOutput methods

extension LoginPresenter: LoginViewOutput {

    func viewIsReady() {
    }
}


// MARK: LoginInteractorOutput methods

extension LoginPresenter: LoginInteractorOutput {
}
