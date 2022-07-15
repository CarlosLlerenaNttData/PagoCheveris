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
    var logoutBarButtonItem: UIBarButtonItem!
    var qrButtonItem: UIBarButtonItem!

    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        selectedIndex = 0
        tabBarMenu.tintColor = PCColors.tabBarTint
        view.backgroundColor = PCColors.viewBackground2
        primaryStyle()
        configureSignoutButton()
        output.viewIsReady()
    }
    
    private func configureSignoutButton() {
        logoutBarButtonItem = UIBarButtonItem(image: PCImages.pcActionLogout, style: .done, target: self, action: #selector(didTapLogoutButton(_:)))
        navigationItem.setRightBarButton(logoutBarButtonItem, animated: false)
    }
    
    @objc func didTapLogoutButton(_ sender: UIBarButtonItem) {
        output.didTapLogoutButton()
    }
}


// MARK: MainTabBarViewInput Methods

extension MainTabBarViewController: MainTabBarViewInput, PCAlertPanModalPresentable {

    func setUpInitialState() {
    }

    func moduleInput() -> MainTabBarModuleInput {
        return output as! MainTabBarModuleInput
    }
    
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?) {
        showPCAlert(title: title, message: message, primaryAction: primaryAction, secondaryAction: secondaryAction)
    }
}
