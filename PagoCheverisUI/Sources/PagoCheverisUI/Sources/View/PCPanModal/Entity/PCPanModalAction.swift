//
//  PCPanModalAction.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

public struct PCPanModalAction {
    
    public let icon: UIImage?
    public let title: String
    public let action: (() -> Void)?
    
    public init(icon: UIImage? = nil,
                title: String,
                action: (() -> Void)? = nil) {
        self.icon = icon
        self.title = title
        self.action = action
    }
}
