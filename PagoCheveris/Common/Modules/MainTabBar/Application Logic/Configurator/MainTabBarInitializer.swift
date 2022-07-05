//
//  MainTabBarInitializer.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation

class MainTabBarModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var mainTabBarViewController: MainTabBarViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = MainTabBarModuleConfigurator()
        configurator.configureModuleForViewInput(mainTabBarViewController)
    }
}
