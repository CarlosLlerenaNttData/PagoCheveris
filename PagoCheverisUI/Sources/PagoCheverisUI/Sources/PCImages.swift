//
//  PCImages.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

public struct PCImages {
    
    private struct Name {
        static let pcActionCheckmark = "pcActionCheckmark"
        static let pcActionEye = "pcActionEye"
        static let pcActionEyeStrikethrough = "pcActionEyeStrikethrough"
    }
    
    public static let pcActionCheckmark = UIImage.loadImage(named: Name.pcActionCheckmark)
    public static let pcActionEye = UIImage.loadImage(named: Name.pcActionEye)
    public static let pcActionEyeStrikethrough = UIImage.loadImage(named: Name.pcActionEyeStrikethrough)
}
