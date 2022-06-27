//
//  LoginViewController.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import UIKit
import PagoCheverisUI

class LoginViewController: UIViewController, NavigationBarStyle {
    
    @IBOutlet weak var contentView: UIView! {
        didSet{
            contentView.backgroundColor = PCColors.viewBackground2
        }
    }
    
    @IBOutlet weak var headerView: UIView! {
        didSet{
            headerView.backgroundColor = PCColors.tintedNavigationBar
        }
    }
    
    @IBOutlet weak var imageLogo: UIImageView! {
        didSet{
          imageLogo.image = PCImages.pcImageLogo
        }
    }
    
    @IBOutlet weak var labelTitle: UILabel! {
        didSet{
            labelTitle.text = LoginStrings.Login.title
        }
    }
    
    @IBOutlet weak var labelSubtitle: UILabel! {
        didSet{
            labelSubtitle.text = LoginStrings.Login.subTitle
        }
    }
    
    @IBOutlet weak var usernameTextField: PCTextField! {
        didSet{
            usernameTextField.pcTextFieldDelegate = self
            usernameTextField.regex = LoginRegex.username
            usernameTextField.placeholder = LoginStrings.Login.username
            usernameTextField.allowsCopyAndPaste = false
        }
    }
    
    @IBOutlet weak var passwordTextField: PCTextField! {
        didSet{
            passwordTextField.pcTextFieldDelegate = self
            passwordTextField.regex = LoginRegex.userPassword
            passwordTextField.placeholder = LoginStrings.Login.password
            passwordTextField.allowsCopyAndPaste = false
        }
    }
    
    @IBOutlet weak var rememberMeButton: UIButton! {
        didSet{
            rememberMeButton.setTitleColor(PCColors.buttonQuaternary, for: .normal)
            rememberMeButton.setTitle(LoginStrings.Login.rememberMe, for: .normal)
            rememberMeButton.setImage(PCImages.pcRememberChecked, for: .selected)
            rememberMeButton.setImage(PCImages.pcRememberUnchecked, for: .normal)
        }
    }
    
    @IBOutlet weak var loginButton: PCButtonPrimary! {
        didSet{
            loginButton.isEnabled = false
            loginButton.setTitle(LoginStrings.Login.submit, for: .normal)
        }
    }
    
    @IBOutlet weak var recoverButton: UIButton! {
        didSet{
            recoverButton.setTitleColor(PCColors.buttonTertiary, for: .normal)
            recoverButton.setTitle(LoginStrings.Login.forgotPassword, for: .normal)
        }
    }
    
    @IBOutlet weak var facialRecognition: UIButton! {
        didSet{
            facialRecognition.setImage(PCImages.pcFaceLogo, for: .normal)
            facialRecognition.setTitleColor(PCColors.buttonTertiary, for: .normal)
            facialRecognition.setTitle(LoginStrings.Login.facialRecognition, for: .normal)
        }
    }
    
    var shouldEnableLogInButton: Bool  {
        !(usernameTextField?.text?.isEmpty == true)  &&
        !(passwordTextField?.text?.isEmpty == true) &&
        (passwordTextField?.text?.count ?? 0) > 3
    }
    
    var output: LoginViewOutput!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearStyle()
        output.viewIsReady()
    }

    @IBAction func rememberMeToggle() {
        rememberMeButton.isSelected = !rememberMeButton.isSelected
       // output.didTapRememberToggle(rememberCredentials: rememberMeButton.isSelected)
    }
    
    @IBAction func didTapForgotPasswordButton(_ sender: UIButton) {
        //No-op
    }
    
    @IBAction func didTapMoreOptionsButton(_ sender: UIButton) {
        //No-op
    }
    
    @IBAction func didTapLoginButton(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else { return }
//        output.didTapLoginButton(code: code, username: username, password: password,rememberCredentials: rememberMeButton.isSelected)
    }
}


// MARK: LoginViewInput Methods
extension LoginViewController: LoginViewInput, PCAlertPanModalPresentable {

    func setUpInitialState() {
    }
    
    func moduleInput() -> LoginModuleInput {
        return output as! LoginModuleInput
    }
    
    func showAlert(title: String, message: String, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?) {
        showPCAlert(title: title, message: message, primaryAction: primaryAction, secondaryAction: secondaryAction)
    }

}

extension LoginViewController : PCTextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: PCTextField) {
        loginButton.isEnabled = shouldEnableLogInButton
    }
    
    func textFieldDidEndEditing(_ textField: PCTextField) {
        loginButton.isEnabled = shouldEnableLogInButton
    }
    
    func textFieldDidChange(_ textField: PCTextField) {
        loginButton.isEnabled = shouldEnableLogInButton
    }
}
