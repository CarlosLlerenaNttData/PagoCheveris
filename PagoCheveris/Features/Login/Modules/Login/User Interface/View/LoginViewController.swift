//
//  LoginViewController.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var output: LoginViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

        output.viewIsReady()
    }
}


// MARK: LoginViewInput Methods

extension LoginViewController: LoginViewInput {

    func setUpInitialState() {
    }

    func moduleInput() -> LoginModuleInput {
        return output as! LoginModuleInput
    }
}
