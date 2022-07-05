//
//  LoginInteractorInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

protocol LoginInteractorInput {
    func login(username: String, password: String)
    func loadCredentials()
    func saveCredentials(username: String, password: String)
    func deleteUserCredentials()
}
