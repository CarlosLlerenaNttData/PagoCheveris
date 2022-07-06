//
//  PaymentsInitializer.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Foundation

class PaymentsModuleInitializer: NSObject {

    // TODO: Connect with object on storyboard
    @IBOutlet weak var paymentsViewController: PaymentsViewController!

    override func awakeFromNib() {
        super.awakeFromNib()

        let configurator = PaymentsModuleConfigurator()
        configurator.configureModuleForViewInput(paymentsViewController)
    }
}
