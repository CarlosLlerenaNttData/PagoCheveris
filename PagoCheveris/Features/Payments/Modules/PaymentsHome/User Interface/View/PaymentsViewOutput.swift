//
//  PaymentsViewOutput.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

protocol PaymentsViewOutput {

    func viewIsReady()
    func didTapSortButton()
    func didTapQrRead()
    func didSearchBarText(searchText: String)
    func didSelectedTabControlItem(item: PCTabItem)
    func didTapPaymentAction(for payment: Payment, completion: @escaping (Bool) -> Void)
    func didTapConfirmSelectionButton(withSelection list: [Payment])
}
