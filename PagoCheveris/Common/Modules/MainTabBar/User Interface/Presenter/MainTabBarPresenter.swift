//
//  MainTabBarPresenter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import PagoCheverisUI

class MainTabBarPresenter {

    weak var view: MainTabBarViewInput!
    var interactor: MainTabBarInteractorInput!
    var router: MainTabBarRouterInput!
}


// MARK: MainTabBarModuleInput methods

extension MainTabBarPresenter: MainTabBarModuleInput {

    func initializeModule() {
    }
}


// MARK: MainTabBarViewOutput methods

extension MainTabBarPresenter: MainTabBarViewOutput {

    func viewIsReady() {
    }
    
    func didTapLogoutButton() {
        let exitAction = PCPanModalAction(title: CommonStrings.exit) { [weak self] in
            self?.router.routeToLogin()
        }
        
        let cancelAction = PCPanModalAction(title: CommonStrings.cancel)
        
        view.showAlert(title: CommonStrings.exit, message: CommonStrings.alertMessageSignOut, primaryAction: exitAction, secondaryAction: cancelAction)
    }
}


// MARK: MainTabBarInteractorOutput methods

extension MainTabBarPresenter: MainTabBarInteractorOutput {
}
