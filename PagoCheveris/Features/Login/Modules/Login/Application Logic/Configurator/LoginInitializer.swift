//
//  LoginInitializer.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation

class LoginModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var loginViewController: LoginViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(loginViewController)
    }
}
