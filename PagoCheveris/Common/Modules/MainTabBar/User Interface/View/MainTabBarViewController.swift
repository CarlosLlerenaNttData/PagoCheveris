//
//  MainTabBarViewController.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit

class MainTabBarViewController: UIViewController {

    var output: MainTabBarViewOutput!


    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

	    // TODO: View set up code goes here. Please remove this comment.

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
