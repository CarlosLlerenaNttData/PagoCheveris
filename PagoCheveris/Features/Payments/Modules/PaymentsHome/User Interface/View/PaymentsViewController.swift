//
//  PaymentsViewController.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import PagoCheverisUI

class PaymentsViewController: UIViewController {

    // MARK: Properties

    var output: PaymentsViewOutput!

   
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: PaymentsViewInput Methods

extension PaymentsViewController: PaymentsViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> PaymentsModuleInput {
        return output as! PaymentsModuleInput
    }
}
