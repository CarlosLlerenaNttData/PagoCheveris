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
    
    var paymentsList: [Payment] = []
    
    var filteredPaymentsList: [Payment] = [] {
        didSet {
            paymentsTableView.reloadData()
        }
    }
    
    var selectedPaymentsList: [Payment] = [] {
        didSet {
            configureConfirmSelectionButton()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.placeholder = CommonStrings.search
            searchBar.backgroundImage = UIImage()
            searchBar.searchBarStyle = .prominent
            searchBar.backgroundColor = PCColors.viewBackground2
            searchBar.searchTextField.backgroundColor = PCColors.viewBackground1
            searchBar.delegate = self
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
    
    private var confirmSelectionButton: UIButton? {
        didSet {
            confirmSelectionButton?.clipsToBounds = true
            confirmSelectionButton?.layer.cornerRadius = 30
            confirmSelectionButton?.tintColor = PCColors.buttonLightContent
            confirmSelectionButton?.backgroundColor = PCColors.buttonPrimary
            confirmSelectionButton?.setImage(PCImages.pcActionCheckmark, for: .normal)
            confirmSelectionButton?.addTarget(self, action: #selector(didTapConfirmSelectionButton), for: .touchUpInside)
        }
    }
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PCColors.viewBackground2
        configureMainNavigation()
        configureQrReadButton()
        output.viewIsReady()
    }
    
    func configureMainNavigation() {
        navigationController?.isNavigationBarHidden = true
        tabBarController?.title = PaymentsStrings.Home.title
    }
    
    private func configureQrReadButton() {
        let qrButtonItem = UIBarButtonItem(image: PCImages.pcQrReadLogo, style: .done, target: self, action: #selector(didTapQrRead(_:)))
        tabBarController?.navigationItem.setLeftBarButton(qrButtonItem, animated: false)
    }
    
    @objc func didTapQrRead(_ sender: UIBarButtonItem) {
        output.didTapQrRead()
    }
    
    func configureConfirmSelectionButton() {
        if selectedPaymentsList.isEmpty {
            confirmSelectionButton?.removeFromSuperview()
            confirmSelectionButton = nil
        } else {
            guard confirmSelectionButton == nil else { return }
            
            confirmSelectionButton = UIButton(type: .custom)
            view.addSubview(confirmSelectionButton!)
            
            confirmSelectionButton?.snp.makeConstraints { make in
                make.width.height.equalTo(60)
                make.trailing.bottom.equalTo(paymentsTableView).inset(16)
            }
        }
    }
    
    @IBAction func didTapSortButton(_ sender: PCButton) {
        output.didTapSortButton()
    }
    
    @objc func didTapConfirmSelectionButton() {
        output.didTapConfirmSelectionButton(withSelection: selectedPaymentsList)
    }
    
    func filterContent(searchText: String){
        filteredPaymentsList = searchText.isEmpty ? paymentsList : paymentsList.filter { payment in
            return payment.company.lowercased().contains(searchText)
        }
    }
}

// MARK: TableView Delegate & Data source

extension PaymentsViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchText = searchBar.text else { return }
        filterContent(searchText: searchText.lowercased())
    }
}

// MARK: TableView Delegate & Data source

extension PaymentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredPaymentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as PaymentTableViewCell
        let payment = filteredPaymentsList[indexPath.row]
        let shouldSetRowSelected = selectedPaymentsList.contains(where: { $0.paymentId == payment.paymentId })
        cell.configure(with: payment, shouldSetSelected: shouldSetRowSelected)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let payAction = UIContextualAction(style: .normal, title: CommonStrings.pay) { [weak self] _, _, completion in
            guard let payment = self?.filteredPaymentsList[indexPath.row] else { return }
            self?.output.didTapPaymentAction(for: payment, completion: completion)
        }
        
        payAction.image = PCImages.pcActionCheckmark
        payAction.backgroundColor =  PCColors.success
     
        let config = UISwipeActionsConfiguration(actions: [payAction])
        config.performsFirstActionWithFullSwipe = false
     
        return config
    }
}

// MARK: AuthorizationTableViewCellDelegate Delegate

extension PaymentsViewController: PaymentTableViewCellDelegate {
    
    func didTapCheckBoxButton(for payment: Payment, isSelected: Bool) {
        if isSelected {
            selectedPaymentsList.append(payment)
        } else {
            selectedPaymentsList.removeAll(where: { $0.paymentId == payment.paymentId } )
        }
    }
}

// MARK: PCTabControlDelegate Delegate

extension PaymentsViewController: PCTabControlDelegate {
    
    func didSelect(tab: PCTabItem) {
        output.didSelectedTabControlItem(item: tab)
    }
}

// MARK: PaymentsViewInput Methods

extension PaymentsViewController: PaymentsViewInput, PCAlertPanModalPresentable, PCActivityIndicatorPresentable, PCOptionListPanModalPresentable, PCQrReadPresentable {

    func setUpInitialState() {
    }
    
    func moduleInput() -> PaymentsModuleInput {
        return output as! PaymentsModuleInput
    }
    
    func setPaymentsList(_ paymentsList: [Payment]) {
        self.paymentsList = paymentsList
        self.filteredPaymentsList = self.paymentsList
    }
    
    func removeFromPaymentList(payments: [Payment]) {
        payments.forEach { payment in
            self.paymentsList.removeAll(where: { $0.paymentId == payment.paymentId } )
        }
        
        paymentsTableView.reloadData()
    }
    
    func resetPaymentsSelection() {
        selectedPaymentsList = []
        paymentsTableView.reloadData()
    }

    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?) {
        showPCAlert(title: title, message: message, primaryAction: primaryAction, secondaryAction: secondaryAction)
    }
    
    func showAlert(message: String, icon: UIImage, iconTint: UIColor, primaryAction: PCPanModalAction) {
        showPCAlert(message: message, icon: icon, iconTint: iconTint, primaryAction: primaryAction)
    }
    
    func showOrderList(title: String, delegate: PCOptionsPanModalDelegate, options: [PCPanModalOption]) {
        showPCOptionList(title: title, delegate: delegate, options: options)
    }
    
    func showQrReadView(delegate: PCQrReadDelegate) {
        showQrRead(delegate: delegate)
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
