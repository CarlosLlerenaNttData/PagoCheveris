//
//  PCOptionCell.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/07/22.
//

import UIKit

final class PCOptionCell: UITableViewCell {
       
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = PCColors.viewBackground2
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = PCColors.labelQuaternary
            titleLabel.font = PCFont.medium14
        }
    }
    
    @IBOutlet weak var checkImage: UIButton! {
        didSet {
            checkImage.backgroundColor = PCColors.viewBackground2
            checkImage.layer.cornerRadius = 8.0
            checkImage.layer.borderWidth = 1.0
            checkImage.layer.borderColor = PCColors.buttonPrimary.cgColor
        }
    }
    
    func configure(option: PCPanModalOption) {
        titleLabel.text = option.title
        backgroundColor = PCColors.viewBackground1
        selectionStyle = .none
        containerView.layer.cornerRadius = 15.0
        containerView.layer.borderColor = PCColors.buttonPrimary.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        if selected {
            UIView.animate(withDuration: 0.2) { [weak self] in
                self?.checkImage.layer.borderWidth = 4.5
                self?.containerView.layer.borderWidth = 2.5
            }
        } else {
            checkImage.layer.borderWidth = 1.5
            containerView.layer.borderWidth = 0
        }
    }
}
