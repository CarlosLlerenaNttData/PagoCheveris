//
//  PCTextFieldPassword.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

/**
 A PCTextFieldPassword object is a control that displays editable text with attributes for a password input.  You typically use this class the same way you use UITextField.
*/
public class PCTextFieldPassword: PCTextField {
    
    // MARK: - Properties
    
    /**
    Button displayed in the right view for a *PCTextFieldPassword*. This button is used to toggle the *secureTextEntry* parameter.
    */
    private let accessoryButton = UIButton()
    
    
    // MARK: - Overrides
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setRightView()
    }
    
    public override var isSecureTextEntry: Bool {
        didSet {
            let image = isSecureTextEntry ? PCImages.pcActionEyeStrikethrough : PCImages.pcActionEye
            accessoryButton.setImage(image, for: .normal)
        }
    }
    
    override func setAttributes() {
        super.setAttributes()
        isSecureTextEntry = true
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let side = bounds.height
        return CGRect(x: textfieldInsets.x, y: 0, width: bounds.width - (textfieldInsets.x + side), height: side) /// Remove space occupied by *accesoryButton*
    }
    
    
    // MARK: - Private Helpers
    
    /**
     Adds a view with a button for toggling the `isSecureTextEntry`parameter of the textField.
     This will also change the buttons image accordingly.
     */
    private func setRightView() {
        let right = UIView(frame: CGRect(x: 0, y: 0, width: bounds.height, height: bounds.height))
        rightView = right
        rightViewMode = .always
        rightView?.isUserInteractionEnabled = true
        
        let side: CGFloat = 30.0
        let padding: CGFloat = (right.frame.width - side) / 2
        accessoryButton.tintColor = PCColors.buttonSecondary
        accessoryButton.frame = CGRect(x: padding, y: padding, width: side, height: side)
        accessoryButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.isSecureTextEntry.toggle()
        }), for: .touchUpInside)
        rightView?.addSubview(accessoryButton)
    }
}
