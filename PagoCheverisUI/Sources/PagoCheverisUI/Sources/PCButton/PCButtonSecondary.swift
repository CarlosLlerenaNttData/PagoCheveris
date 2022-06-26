//
//  PCButtonSecondary.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

/**
 This BiButton subclass displays a bordered styled button.
*/
public class PCButtonSecondary: PCButton {
    
    // MARK: - Overrides
    
    override func setAppearance() {
        super.setAppearance()
        setOutlineColor()
        setContentColor()
    }
    
    override public var isEnabled: Bool {
        didSet {
            setOutlineColor()
        }
    }
    
    
    // MARK: - Appearance
    
    private func setContentColor() {
        setTitleColor(PCColors.buttonSecondary, for: .normal)
        setTitleColor(PCColors.buttonDisabled, for: .disabled)
        tintColor = PCColors.buttonSecondary
    }
    
    private func setOutlineColor() {
        layer.borderColor = (isEnabled ? PCColors.buttonSecondary : PCColors.buttonDisabled).cgColor
        layer.borderWidth = 2.5
    }
}
