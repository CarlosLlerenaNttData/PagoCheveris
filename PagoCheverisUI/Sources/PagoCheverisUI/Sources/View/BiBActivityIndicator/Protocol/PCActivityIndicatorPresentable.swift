//
//  PCActivityIndicatorPresentable.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 30/06/22.
//

import UIKit

fileprivate var pcActivityIndicatorView: PCActivityIndicatorView!

public protocol PCActivityIndicatorPresentable {
    
    func showPCActivityIndicatorView()
    func hidePCActivityIndicatorView()
}

public extension PCActivityIndicatorPresentable where Self: UIViewController {
    
    func showPCActivityIndicatorView() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        let frame = keyWindow?.bounds ?? self.view.bounds
        pcActivityIndicatorView = PCActivityIndicatorView(frame: frame)
        
        if let window = keyWindow {
            window.addSubview(pcActivityIndicatorView)
        } else {
            self.view.addSubview(pcActivityIndicatorView)
        }
    }
    
    func hidePCActivityIndicatorView() {
        pcActivityIndicatorView?.removeFromSuperview()
    }
}
