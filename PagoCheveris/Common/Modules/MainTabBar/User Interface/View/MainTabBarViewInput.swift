//
//  MainTabBarViewInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

protocol MainTabBarViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> MainTabBarModuleInput
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?)
}
