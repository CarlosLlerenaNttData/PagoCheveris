//
//  PaymentsPresenter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PaymentsPresenter {

    weak var view: PaymentsViewInput!
    var interactor: PaymentsInteractorInput!
    var router: PaymentsRouterInput!
}


// MARK: PaymentsModuleInput methods

extension PaymentsPresenter: PaymentsModuleInput {

    func initializeModule() {
    }
}


// MARK: PaymentsViewOutput methods

extension PaymentsPresenter: PaymentsViewOutput {

    func viewIsReady() {
    }
    
    func didTapSortButton() {
    }
}


// MARK: PaymentsInteractorOutput methods

extension PaymentsPresenter: PaymentsInteractorOutput {
}
