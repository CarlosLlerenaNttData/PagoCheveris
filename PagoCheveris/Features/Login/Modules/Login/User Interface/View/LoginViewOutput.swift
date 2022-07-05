//
//  LoginViewOutput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol LoginViewOutput {

    func viewIsReady()
    func didTapLoginButton(username: String, password: String, rememberCredentials: Bool)
    func didTapRememberToggle(rememberCredentials: Bool)
}
