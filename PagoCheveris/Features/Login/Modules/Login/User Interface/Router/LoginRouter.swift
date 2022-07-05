//
//  LoginRouter.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

class LoginRouter: LoginRouterInput, Routable {
    
    weak var viewController: LoginViewController!
    
    func routeToToMainNavigation() {
        replaceRoot(withIdentifier: MainTabBarViewController.storyboardIdentifier,
                    type: MainTabBarViewController.self,
                    in: .mainNavigation,
                    from: viewController) { controller in
            controller.moduleInput().initializeModule()
        }
    }
}
