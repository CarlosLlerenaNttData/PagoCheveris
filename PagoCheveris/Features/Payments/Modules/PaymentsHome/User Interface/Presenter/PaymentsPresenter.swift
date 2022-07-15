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
    
    var swipeActionCompletion: ((Bool) -> Void)?

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
    
    func didTapQrRead() {
        view.showQrReadView(delegate: self)
    }
    
    func didSelectedTabControlItem(item: PCTabItem) {
        view.showActivityIndicatorView()
        paymentCategory = item as? PaymentCategory
        interactor.getPaymentsList(category: paymentCategory,
                                   order: paymentsListOrder)
    }
    
    func didTapPaymentAction(for payment: Payment, completion: @escaping (Bool) -> Void) {
        let cancelAction = PCPanModalAction(title: CommonStrings.cancel) { [weak self] in
            self?.swipeActionCompletion?(false)
        }
        
        let authorizeAction = PCPanModalAction(title: CommonStrings.pay) { [weak self] in
            self?.view.showActivityIndicatorView()
            self?.interactor.performPayment(for: [payment])
        }
        
        swipeActionCompletion = completion
        view.showAlert(title: CommonStrings.pay, message: PaymentsStrings.Home.payConfirmationAlertMessage,
                       primaryAction: authorizeAction, secondaryAction: cancelAction)
    }
    
    func didTapConfirmSelectionButton(withSelection list: [Payment]) {
        let payAction = PCPanModalAction(title: CommonStrings.pay) { [weak self] in
            self?.view.showActivityIndicatorView()
            self?.interactor.performPayment(for: list)
        }
        
        let cancelAction = PCPanModalAction(title: CommonStrings.cancel) { [weak self] in
            self?.view.resetPaymentsSelection()
        }
        
        view.showAlert(title: CommonStrings.pay, message: PaymentsStrings.Home.multipleSelectionPaymentConfirmationAlertMessage,
                       primaryAction: payAction,
                       secondaryAction: cancelAction)
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
    
    func didPerformAction(payments: [Payment]) {
        view.hideActivityIndicatorView()
        view.removeFromPaymentList(payments: payments)
        view.resetPaymentsSelection()

        let acceptAction = PCPanModalAction(title: CommonStrings.accept)
        let icon = PCImages.pcActionsCircleCheckmark
        let iconTint = PCColors.success
        view.showAlert(message: PaymentsStrings.Home.payFinishAlertMessage, icon: icon, iconTint: iconTint, primaryAction: acceptAction)
    }
    
    func didFailPerformingAction(title: String, message: String) {
        view.hideActivityIndicatorView()

        let acceptAction = PCPanModalAction(title: CommonStrings.accept)
        view.showAlert(title: title, message: message, primaryAction: acceptAction, secondaryAction: nil)
    }
    
    func didActivedPayment() {
        view.showActivityIndicatorView()
        
        interactor.getPaymentsList(category: paymentCategory,
                                   order: paymentsListOrder)
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

// MARK: PCQrReadDelegate Delegate methods

extension PaymentsPresenter: PCQrReadDelegate {

    func didQrResponse(code: String) {
        interactor.activePayment(for: code)
    }
}
