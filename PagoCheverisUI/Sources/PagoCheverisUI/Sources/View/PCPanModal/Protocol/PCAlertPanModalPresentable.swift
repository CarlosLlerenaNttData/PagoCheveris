//
//  PCAlertPanModalPresentable.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

public protocol PCAlertPanModalPresentable {
    
    /**
     A custom object that displays an interactive alert  to the user.
     
     - Parameter title: Title for the alert (Required).
     - Parameter message: A message displayed below the title (Required).
     - Parameter primaryAction: The attributes to be assigned for the primary button (Required).
     - Parameter secondaryAction: The attributes to be assigned for the secondary button. (Optional).
     
     ### Usage Example: ###
     ````
     extension ViewController: PCAlertPanModalPresentable {}
     
     let myAction = PCPanModalAction(icon: PCImages.myButtonIcon,
                                title: "Continuar",
                                action: {
                                 print("action1 tapped")
                                })
     
     showAlert(title: "Alerta", message: "Ha excedido el número máximo de intentos.", primaryAction: myAction)
     ````
     */
    func showPCAlert(title: String?, message: String, icon: UIImage?, iconTint: UIColor?, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction?)
}

public extension PCAlertPanModalPresentable where Self: UIViewController {
    
    func showPCAlert(title: String? = nil, message: String, icon: UIImage? = nil, iconTint: UIColor? = nil, primaryAction: PCPanModalAction, secondaryAction: PCPanModalAction? = nil) {
        let storyboard = UIStoryboard(name: "PCPanModal", bundle: Bundle.module)
        let alertPanModalController = storyboard.instantiateViewController(withIdentifier: "PCAlertPanModalViewController") as! PCAlertPanModalViewController
        
        var sourceRect: CGRect = .zero
        var sourceView: UIView?
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.maxY, width: 0, height: 0)
            sourceView = view
        }
        
        alertPanModalController.loadView()
        
        self.presentPanModal(alertPanModalController, sourceView: sourceView, sourceRect: sourceRect)
        
        alertPanModalController.messageLabel?.text = message
        alertPanModalController.primaryAction = primaryAction
        
        
        if let title = title {
            alertPanModalController.titleLabel?.text = title
        } else {
            alertPanModalController.titleLabel?.removeFromSuperview()
        }
        
        if let icon = icon {
            alertPanModalController.iconImageView?.image = icon
            alertPanModalController.iconImageView?.tintColor = iconTint
        } else {
            alertPanModalController.iconImageView?.removeFromSuperview()
        }
        
        if let secondaryAction = secondaryAction {
            alertPanModalController.secondaryAction = secondaryAction
        } else {
            alertPanModalController.secondaryButton?.removeFromSuperview()
        }
    }
}
