//
//  PaymentTableViewCell.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 7/07/22.
//

import UIKit
import PagoCheverisUI

protocol PaymentTableViewCellDelegate: AnyObject {
    
    func didTapCheckBoxButton(for payment: Payment, isSelected: Bool)
}

class PaymentTableViewCell: UITableViewCell {
    
    var payment: Payment!
    
    weak var delegate: PaymentTableViewCellDelegate?
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = PCColors.viewBackground1
        }
    }
    
    @IBOutlet weak var typeAbbrvLabel: UILabel! {
        didSet {
            typeAbbrvLabel.layer.cornerRadius = 22.5
            typeAbbrvLabel.font = PCFont.semiBold16
            typeAbbrvLabel.textColor = PCColors.labelPrimary
            typeAbbrvLabel.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.font = PCFont.semiBold16
            typeLabel.textColor = PCColors.labelQuaternary
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.lineBreakMode = .byWordWrapping
            dateLabel.numberOfLines = 0
            dateLabel.font = PCFont.semiBold15
            dateLabel.textColor = PCColors.labelQuinary
        }
    }
    
    @IBOutlet weak var amountTitleLabel: UILabel! {
        didSet {
            amountTitleLabel.text = PaymentsStrings.Home.amount
            amountTitleLabel.font = PCFont.semiBold16
            amountTitleLabel.textColor = PCColors.labelQuinary
        }
    }

    @IBOutlet weak var amountLabel: UILabel! {
        didSet {
            amountLabel.font = PCFont.semiBold16
            amountLabel.textColor = PCColors.labelQuaternary
        }
    }
    
    
    @IBOutlet weak var checkboxButton: UIButton! {
        didSet {
            let configuration = UIButton.Configuration.plain()
            
            checkboxButton.configuration = configuration
            checkboxButton.configuration?.background.cornerRadius = 11
            checkboxButton.configurationUpdateHandler = { button in
                switch button.state {
                case .selected:
                    button.configuration?.image = PCImages.pcActionCircleFillCheckmark
                    button.configuration?.background.backgroundColor = PCColors.viewBackground1
                    button.configuration?.baseForegroundColor = PCColors.buttonPrimary
                default:
                    button.configuration?.image = nil
                    button.configuration?.background.backgroundColor = PCColors.buttonSecondary.withAlphaComponent(0.15)
                }
            }
        }
    }
    
    @IBAction func didTapCheckboxButton(_ sender: UIButton) {
        checkboxButton.isSelected.toggle()
        delegate?.didTapCheckBoxButton(for: payment, isSelected: checkboxButton.isSelected)
    }
    
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.numberOfLines = 0
            contentLabel.font = PCFont.semiBold16
            contentLabel.textColor = PCColors.labelQuinary
        }
    }
    
    func configure(with payment: Payment, shouldSetSelected isSelected: Bool) {
        typeAbbrvLabel.text = payment.amount
        typeLabel.text = payment.categoryName
        dateLabel.text = payment.dateCharged
        amountLabel.text = payment.amount
        contentLabel.text = payment.company
        checkboxButton.isSelected = isSelected
        self.payment = payment
    }
}
