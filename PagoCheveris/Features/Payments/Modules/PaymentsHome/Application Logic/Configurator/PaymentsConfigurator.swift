//
//  PaymentsConfigurator.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class PaymentsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? PaymentsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PaymentsViewController) {

        let router = PaymentsRouter()

        let presenter = PaymentsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PaymentsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
