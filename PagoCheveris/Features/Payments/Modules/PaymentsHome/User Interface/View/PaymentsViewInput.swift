//
//  PaymentsViewInput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI
import UIKit

protocol PaymentsViewInput: AnyObject {

    func setUpInitialState()
    func moduleInput() -> PaymentsModuleInput
    func setPaymentsList(_ paymentsList: [Payment])
    func removeFromPaymentList(payments: [Payment])
    func resetPaymentsSelection()
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?)
    func showAlert(message: String, icon: UIImage, iconTint: UIColor, primaryAction: PCPanModalAction)
    func showOrderList(title: String, delegate: PCOptionsPanModalDelegate, options: [PCPanModalOption])
    func showActivityIndicatorView()
    func hideActivityIndicatorView()
    func showEmptyState()
}
