//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/07/22.
//

import UIKit

public protocol PCQrReadPresentable {
    
    /**
     A custom object that displays an interactive alert  to the user.
     
     - Parameter delegate: delegate  (Required).

     ### Usage Example: ###
     ````
     extension ViewController: PCAlertPanModalPresentable {}
     
     showQrRead(delegate: delegate)
     ````
     */
    func showQrRead(delegate: PCQrReadDelegate)
}

public extension PCQrReadPresentable where Self: UIViewController {
    
    func showQrRead(delegate: PCQrReadDelegate) {
        let storyboard = UIStoryboard(name: "PCQrReadViewController", bundle: Bundle.module)
        let alertPanModalController = storyboard.instantiateViewController(withIdentifier: "PCQrReadViewController") as! PCQrReadViewController
        
        
        self.present(alertPanModalController, animated: true)
    }
}
