//
//  PCTextField.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

/**
 A PCTextField object is a control that displays editable text with a reactive border color.  You typically use this class the same way you use UITextField.
*/
public class PCTextField: UITextField {
    
    // MARK: Properties
    
    /// The insets for the `textRect` and the `editingRect`
    public weak var pcTextFieldDelegate: PCTextFieldDelegate!
    
    /// The insets for the `textRect` and the `editingRect`
    var textfieldInsets = CGPoint(x: 16, y: 0)
    
    private var borderWidth: CGFloat = 2.0
    private var borderRadius: CGFloat = 15.0
    private var invalidInput: Bool = false
    let textFont: UIFont = PCFont.bold15
    
    public var regex: String?
    public var allowsCopyAndPaste = true

    // MARK: - Overrides
    
    public override var text: String? {
        didSet {
            // Change `invalidInput` if text has changed
            invalidInput = false
            
            // Set appropriate border color for text change
            guard let isEmpty = text?.isEmpty else { return }
            setBorderColor(for: ( isEmpty ? .inactive : .activated ))
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setAttributes()
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        delegate = self
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        pcTextFieldDelegate?.textFieldDidChange(self)
    }
    
    // Set a new rect responding to the textField insets.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        let side = bounds.height
        return CGRect(x: textfieldInsets.x, y: 0, width: bounds.width - (textfieldInsets.x * 2), height: side)
    }
    
    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(paste(_:)) || action == #selector(copy(_:)) || action == #selector(cut(_:)) {
            return allowsCopyAndPaste
        } else {
            return true
        }
    }
    
    // MARK: Helper Methods
    
    /**
    Will change the border color responding to the PCTextField State
    */
    private func setBorderColor(for state: PCTextFieldState) {
        switch state {
        case .inactive:
            layer.borderColor = PCColors.textFieldInactiveOutline.cgColor
        case .focused:
            layer.borderColor = PCColors.textFieldFocusedOutline.cgColor
        case .activated:
            layer.borderColor = PCColors.textFieldActivatedOutline.cgColor
        case .error:
            layer.borderColor = PCColors.error.withAlphaComponent(0.50).cgColor
        }
    }
    
    /**
     Override this function fo set the textField display attributes.
    */
    func setAttributes() {
        font = textFont
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.cornerRadius = borderRadius
        borderStyle = .none
        tintColor = PCColors.textFieldTint
        textColor = PCColors.textFieldText
        backgroundColor = PCColors.viewBackground1
        setBorderColor(for: .inactive)
    }
    
    /**
     Sets the border for PCTextField to a color that indicates an invalid input.
    */
    public func setInvalidInput() {
        invalidInput = true
        setBorderColor(for: .error)
    }
    
    
    // MARK: PCTextFieldState
    
    /**
     Internal type to make changes on the textfield border color depending on the current state.
       - *Inactive*: not editing & empty textfield.
       - *Activated*: not editing & text in textfield.
       - *Focused*: currently editing
       - *Error*: textfield input is invalid
     */
    private enum PCTextFieldState {
        case inactive, activated, focused, error
    }
}


// MARK: - UITextField delegate
extension PCTextField: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        // Don't remove error color if text hasn't changed
        if invalidInput { return }
        
        // Set border color for current state
        setBorderColor(for: .focused)
        
        // PCTextField Delegate
        pcTextFieldDelegate?.textFieldDidBeginEditing(self)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        // Don't remove error color if text hasn't changed
        if invalidInput { return }
        
        // Set border color for current state
        guard let text = text else { setBorderColor(for: .inactive); return }
        let state: PCTextFieldState = text.isEmpty ? .inactive : .activated
        setBorderColor(for: state)
        
        // PCTextField Delegate
        pcTextFieldDelegate?.textFieldDidEndEditing(self)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Change `invalidInput` if text has changed
        invalidInput = false
        
        // Don't remove error color if text hasn't changed
        setBorderColor(for: .focused)
        
        if let regex = regex,
            let currentString = textField.text,
            let swiftRange = Range(range, in: currentString) {
            let newString = currentString.replacingCharacters(in: swiftRange, with: string)
            
            return newString.isEmpty ?  true : newString.isValid(regex: regex)
        }

        return true
    }
}
