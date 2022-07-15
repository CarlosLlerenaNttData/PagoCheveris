//
//  PaymentsPresenter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

class PaymentsPresenter {

    weak var view: PaymentsViewInput!
    var interactor: PaymentsInteractorInput!
    var router: PaymentsRouterInput!
    
    var paymentCategory: PaymentCategory?
    var paymentsListOrder: PaymentListOrder = .descendingDate
}

// MARK: PaymentsModuleInput methods

extension PaymentsPresenter: PaymentsModuleInput {

    func initializeModule() {
    }
}


// MARK: PaymentsViewOutput methods

extension PaymentsPresenter: PaymentsViewOutput {

    func viewIsReady() {
        view.showActivityIndicatorView()
        
        interactor.getPaymentsList(category: paymentCategory,
                                   order: paymentsListOrder)
    }
    
    func didTapSortButton() {
        let options = [
            PaymentListOrder.descendingAmount,
            PaymentListOrder.ascendingAmount,
            PaymentListOrder.descendingDate,
            PaymentListOrder.ascendingDate
        ]
        
        view.showOrderList(title: PaymentsStrings.Home.titleOrder, delegate: self, options: options)
    }
    
    func didSelectedTabControlItem(item: PCTabItem) {
        view.showActivityIndicatorView()
        paymentCategory = item as? PaymentCategory
        interactor.getPaymentsList(category: paymentCategory,
                                   order: paymentsListOrder)
    }
}


// MARK: PaymentsInteractorOutput methods

extension PaymentsPresenter: PaymentsInteractorOutput {
    
    func didFetchPaymentsList(_ paymentsList: [Payment]) {
        view.hideActivityIndicatorView()

        view.setPaymentsList(paymentsList)
    }
    
    func didFailFetchingPaymentsList(title: String, message: String) {
        view.hideActivityIndicatorView()

        let acceptAction = PCPanModalAction(title: CommonStrings.accept)
        view.showAlert(title: title, message: message, primaryAction: acceptAction, secondaryAction: nil)
    }
    
}

// MARK: PCOptionsPanModal Delegate methods

extension PaymentsPresenter: PCOptionsPanModalDelegate {
    
    func didSelect(selectedOption: PCPanModalOption) {
        view.showActivityIndicatorView()
        paymentsListOrder = selectedOption as! PaymentListOrder
        interactor.getPaymentsList(category: paymentCategory,
                                   order: paymentsListOrder)
    }
}
