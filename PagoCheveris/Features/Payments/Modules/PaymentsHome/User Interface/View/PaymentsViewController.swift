//
//  PaymentsViewController.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import SnapKit
import PagoCheverisUI

class PaymentsViewController: UIViewController {
    
    // MARK: Properties
    var output: PaymentsViewOutput!
    
    var paymentsList: [Payment] = [] {
        didSet {
            emptyStateLabel?.removeFromSuperview()
            paymentsTableView.reloadData()
        }
    }
    
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
    
    @IBOutlet weak var tabControl: PCTabControl! {
        didSet {
            let tabItems: [PCTabItem] = [PCFilters.all,
                                         PaymentCategory.servicesPay,
                                         PaymentCategory.creditCard,
                                         PaymentCategory.SUNAT,
                                         PaymentCategory.institutionPayment,
                                         PaymentCategory.rechargeCell]
            tabControl.configure(with: tabItems)
            tabControl.delegate = self
            tabControl.backgroundColor = PCColors.viewBackground2
        }
    }
    
    @IBOutlet weak var paymentsTableView: UITableView! {
        didSet {
            paymentsTableView.delegate = self
            paymentsTableView.dataSource = self
            paymentsTableView.separatorStyle = .none
            paymentsTableView.keyboardDismissMode = .onDrag
            paymentsTableView.backgroundColor = PCColors.viewBackground2
            paymentsTableView.register(PaymentTableViewCell.self)
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

// MARK: TableView Delegate & Data source

extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        paymentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PaymentTableViewCell
        let payment = paymentsList[indexPath.row]
        cell.configure(with: payment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let payAction = UIContextualAction(style: .normal, title: CommonStrings.pay) { [weak self] _, _, completion in
            guard let payment = self?.paymentsList[indexPath.row] else { return }
            self?.output.didTapPaymentAction(for: payment, completion: completion)
        }
        
        payAction.image = PCImages.pcActionCheckmark
        payAction.backgroundColor =  PCColors.success
     
        let config = UISwipeActionsConfiguration(actions: [payAction])
        config.performsFirstActionWithFullSwipe = false
     
        return config
    }
}

// MARK: PCTabControlDelegate Delegate

extension PaymentsViewController: PCTabControlDelegate {
    
    func didSelect(tab: PCTabItem) {
        output.didSelectedTabControlItem(item: tab)
    }
}

// MARK: PaymentsViewInput Methods

extension PaymentsViewController: PaymentsViewInput, PCAlertPanModalPresentable, PCActivityIndicatorPresentable, PCOptionListPanModalPresentable  {

    func setUpInitialState() {
    }
    
    func moduleInput() -> PaymentsModuleInput {
        return output as! PaymentsModuleInput
    }
    
    func setPaymentsList(_ paymentsList: [Payment]) {
        self.paymentsList = paymentsList
    }
    
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?) {
        showPCAlert(title: title, message: message, primaryAction: primaryAction, secondaryAction: secondaryAction)
    }
    
    func showOrderList(title: String, delegate: PCOptionsPanModalDelegate, options: [PCPanModalOption]) {
        showPCOptionList(title: title, delegate: delegate, options: options)
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
        
        emptyStateLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
