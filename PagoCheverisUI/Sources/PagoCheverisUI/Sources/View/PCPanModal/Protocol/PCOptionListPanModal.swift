//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/07/22.
//

import UIKit

public protocol PCOptionListPanModal {
    
    /**
     A custom object that displays a list of options to the user.
     
     - Parameter title: Title for the alert (Required).
     - Parameter delegate: A delegate when item is selected (Required).
     - Parameter options: Available options to select (Required).
     
     ### Usage Example: ###
     ````
     extension ViewController: PCOrderPanModalPresentable {}
     
    
     showPCOptionList(title: "Selecciona las opciones", delegate: myDelegate , options: [myOptions])
     ````
     */
    func showPCOptionList(title: String, delegate: PCOptionsPanModalDelegate, options: [PCPanModalOption])
}

public extension PCOptionListPanModal where Self: UIViewController {
    
    func showPCOptionList(title: String, delegate: PCOptionsPanModalDelegate, options: [PCPanModalOption]) {
        let storyboard = UIStoryboard(name: "PCPanModal", bundle: Bundle.module)
        let bibOrderPanModalViewController = storyboard.instantiateViewController(withIdentifier: "PCOptionsPanModalViewController") as! PCOptionsPanModalViewController
        
        var sourceRect: CGRect = .zero
        var sourceView: UIView?
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.maxY, width: 0, height: 0)
            sourceView = view
        }
                
        self.presentPanModal(bibOrderPanModalViewController, sourceView: sourceView, sourceRect: sourceRect)
        
        bibOrderPanModalViewController.titleLabel?.text = title
        bibOrderPanModalViewController.optionsList = options
        bibOrderPanModalViewController.delegate = delegate
    }
}
