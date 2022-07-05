//
//  MainTabBarViewController.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import PagoCheverisUI

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate, NavigationBarStyle {
    
    // MARK: Properties

    @IBOutlet weak var tabBarMenu: UITabBar!

    var output: MainTabBarViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        selectedIndex = 0
        tabBarMenu.tintColor = PCColors.tabBarTint
        view.backgroundColor = PCColors.viewBackground2
        primaryStyle()
        output.viewIsReady()
    }
}


// MARK: MainTabBarViewInput Methods

extension MainTabBarViewController: MainTabBarViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> MainTabBarModuleInput {
        return output as! MainTabBarModuleInput
    }
}
