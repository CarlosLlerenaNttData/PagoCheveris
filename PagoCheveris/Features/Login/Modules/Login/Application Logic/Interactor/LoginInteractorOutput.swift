//
//  LoginInteractorOutput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol LoginInteractorOutput: AnyObject {
    func didLogin(user: User)
    func didFailLogin(title: String, message: String)
    func didLoadCredentials(username: String, password: String)
}
