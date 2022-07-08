//
//  PCTabCollectionViewCell.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 8/07/22.
//

import Foundation
import UIKit
import SnapKit

class PCTabCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private var horizontalPadding: CGFloat = 16
    private var verticalPadding: CGFloat = 8
    
    // MARK: Init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    // MARK: Overrides
    
    override var reuseIdentifier: String? {
        "PCCollectionViewCell"
    }
    
    override var isSelected: Bool {
        didSet {
            setAppereanceFor(state: isSelected)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    
    // MARK: Views
    
    private var titleLabel: UILabel!
    
    
    // MARK: Helpers
    
    func configure(with item: PCTabItem) {
        titleLabel.text = item.title
    }
    
    private func configure() {
        layer.cornerRadius = 8
        clipsToBounds = true
        
        titleLabel = UILabel()
        titleLabel.font = PCFont.medium14
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(verticalPadding)
            make.leading.trailing.equalToSuperview().inset(horizontalPadding)
        }
        
        setAppereanceFor(state: false)
    }
    
    private func setAppereanceFor(state selected: Bool) {
        if selected {
            titleLabel.textColor = PCColors.lightLabel
            backgroundColor = PCColors.labelPrimary
        } else {
            titleLabel.textColor = PCColors.labelQuaternary
            backgroundColor = PCColors.viewBackground1
        }
    }
}
