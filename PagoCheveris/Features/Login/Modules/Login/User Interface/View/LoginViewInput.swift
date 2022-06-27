//
//  LoginViewInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol LoginViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> LoginModuleInput
}
