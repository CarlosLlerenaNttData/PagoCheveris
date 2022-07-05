//
//  LoginPresenter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

class LoginPresenter {
    
    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!
    
    var shouldRememberUserCredentials = false
    
    var username: String!
    var password: String!
}


// MARK: LoginModuleInput methods

extension LoginPresenter: LoginModuleInput {
    
    func initializeModule() {
    }
}


// MARK: LoginViewOutput methods

extension LoginPresenter: LoginViewOutput {
    
    func viewIsReady() {
        interactor.loadCredentials()
    }
    
    func didTapLoginButton(username: String, password: String, rememberCredentials: Bool) {
        view.showActivityIndicatorView()
        shouldRememberUserCredentials = rememberCredentials
        self.username = username
        self.password = password
        interactor.login(username: username, password: password)
    }
    
    func didTapRememberToggle(rememberCredentials: Bool) {
        if !rememberCredentials {
            interactor.deleteUserCredentials()
        }
    }
}


// MARK: LoginInteractorOutput methods

extension LoginPresenter: LoginInteractorOutput {
    
    func didLogin(user: User) {
        view.hideActivityIndicatorView()
        
        if shouldRememberUserCredentials {
            interactor.saveCredentials(username: username, password: password)
        }
        
    }
    
    func didFailLogin(title: String, message: String) {
        view.hideActivityIndicatorView()
        
        let acceptAction = PCPanModalAction(title: CommonStrings.accept)
        
        view.showAlert(title: title, message: message, primaryAction: acceptAction, secondaryAction: nil)
    }
    
    func didLoadCredentials(username: String, password: String) {
        view.loadCredentials(username: username, password: password)
        view.updateRememberButton(isSelectedRememberButton: true)
    }
}
