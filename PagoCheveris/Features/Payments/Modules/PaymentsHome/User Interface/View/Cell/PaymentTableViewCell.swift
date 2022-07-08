//
//  PaymentTableViewCell.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 7/07/22.
//

import UIKit
import PagoCheverisUI

class PaymentTableViewCell: UITableViewCell {
    
    var payment: Payment!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = PCColors.viewBackground1
        }
    }
    
    @IBOutlet weak var typeAbbrvLabel: UILabel! {
        didSet {
            typeAbbrvLabel.layer.cornerRadius = 22.5
            typeAbbrvLabel.font = PCFont.semiBold16
            typeAbbrvLabel.textColor = PCColors.buttonLightContent
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
    
    @IBOutlet weak var contentLabel: UILabel! {
        didSet {
            contentLabel.numberOfLines = 0
            contentLabel.font = PCFont.semiBold16
            contentLabel.textColor = PCColors.labelQuinary
        }
    }
    
    func configure(with payment: Payment) {
        typeLabel.text = payment.category
        dateLabel.text = payment.dateCharged
        amountLabel.text = payment.amount
        contentLabel.text = payment.company
    }
}
