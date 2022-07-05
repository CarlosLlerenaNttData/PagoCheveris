//
//  LoginViewInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

protocol LoginViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> LoginModuleInput
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?)
    func loadCredentials(username: String, password: String)
    func updateRememberButton(isSelectedRememberButton: Bool)
    func showActivityIndicatorView()
    func hideActivityIndicatorView()
}
