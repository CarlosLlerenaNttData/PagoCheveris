//
//  PaymentsViewInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

protocol PaymentsViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> PaymentsModuleInput
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?)
    func showActivityIndicatorView()
    func hideActivityIndicatorView()
    func showEmptyState()
}
