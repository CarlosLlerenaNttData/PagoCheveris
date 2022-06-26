//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

public protocol NavigationBarStyle {
    
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
    }
}
