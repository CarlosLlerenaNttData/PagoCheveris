//
//  PCButtonPrimary.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

/**
 This BiButton subclass displays a filled styled button.
*/
public class PCButtonPrimary: PCButton {
    
    // MARK: - Overrides
    
    override func setAppearance() {
        super.setAppearance()
        setBackgroundColor()
        setContentColor()
    }
    
    // MARK: - Appearance
    
    private func setContentColor() {
        setTitleColor(PCColors.buttonLightContent, for: .normal)
        setTitleColor(PCColors.buttonLightContent, for: .disabled)
        tintColor = PCColors.buttonLightContent
    }
    
    private func setBackgroundColor() {
        configurationUpdateHandler = { [weak self] button in
            guard let self = self else { return }
            switch button.state {
            case .disabled:
                self.configuration?.background.backgroundColor = PCColors.buttonDisabled
            default:
                self.configuration?.background.backgroundColor = PCColors.buttonPrimary
            }
        }
    }
}
