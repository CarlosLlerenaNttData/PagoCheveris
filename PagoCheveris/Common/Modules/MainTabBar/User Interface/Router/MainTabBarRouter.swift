//
//  MainTabBarRouter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class MainTabBarRouter: MainTabBarRouterInput, Routable {

    weak var viewController: MainTabBarViewController!

    func routeToLogin() {
        replaceRoot(withIdentifier: LoginViewController.storyboardIdentifier,
                    type: LoginViewController.self,
                    in: .login,
                    from: viewController) { controller in
            controller.moduleInput().initializeModule()
        }
    }
}
