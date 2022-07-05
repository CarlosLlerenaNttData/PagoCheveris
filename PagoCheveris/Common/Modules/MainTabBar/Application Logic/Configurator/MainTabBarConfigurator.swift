//
//  MainTabBarConfigurator.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class MainTabBarModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(_ viewInput: UIViewController) {

        if let viewController = viewInput as? MainTabBarViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainTabBarViewController) {

        let router = MainTabBarRouter()

        let presenter = MainTabBarPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = MainTabBarInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
}
