//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

public protocol NavigationBarStyle {
    
    func primaryStyle()
    func clearStyle()
}

public extension NavigationBarStyle where Self: UIViewController {
    
    func clearStyle() {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.backButtonTitle = ""
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func primaryStyle() {

        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = PCColors.tintedNavigationBar
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : PCColors.tintedNavigationBarItem]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = PCColors.tintedNavigationBarItem
        navigationItem.backButtonTitle = ""
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}
