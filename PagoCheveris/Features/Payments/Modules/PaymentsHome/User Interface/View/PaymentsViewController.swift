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
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.placeholder = CommonStrings.search
            searchBar.backgroundImage = UIImage()
            searchBar.searchBarStyle = .prominent
            searchBar.backgroundColor = PCColors.viewBackground2
            searchBar.searchTextField.backgroundColor = PCColors.viewBackground1
        }
    }
    
    @IBOutlet weak var sortButton: PCButton! {
        didSet {
            sortButton.tintColor = PCColors.buttonLightContent
            sortButton.layer.cornerRadius = 8
            sortButton.clipsToBounds = true
            sortButton.backgroundColor = PCColors.buttonTertiary
            sortButton.setImage(PCImages.pcActionListLeadingArrowUpDown, for: .normal)
        }
    }
    
    // MARK: Views

    private var emptyStateLabel: UILabel! {
        didSet {
            emptyStateLabel?.text = PaymentsStrings.Home.noPendingPayments
            emptyStateLabel?.font = PCFont.semiBold16
            emptyStateLabel?.textColor = PCColors.labelQuinary
        }
    }
    
    // MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PCColors.viewBackground2
        configureMainNavigation()
        output.viewIsReady()
    }
    
    func configureMainNavigation() {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.title = PaymentsStrings.Home.title
    }
    
    @IBAction func didTapSortButton(_ sender: PCButton) {
        output.didTapSortButton()
    }
}


// MARK: PaymentsViewInput Methods

extension PaymentsViewController: PaymentsViewInput, PCAlertPanModalPresentable, PCActivityIndicatorPresentable  {

    func setUpInitialState() {
    }

    func moduleInput() -> PaymentsModuleInput {
        return output as! PaymentsModuleInput
    }
    
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?) {
        showPCAlert(title: title, message: message, primaryAction: primaryAction, secondaryAction: secondaryAction)
    }
    
    func showActivityIndicatorView() {
        showPCActivityIndicatorView()
    }
    
    func hideActivityIndicatorView() {
        hidePCActivityIndicatorView()
    }
    
    func showEmptyState() {
        emptyStateLabel = UILabel()
        view.addSubview(emptyStateLabel)

    }
}
