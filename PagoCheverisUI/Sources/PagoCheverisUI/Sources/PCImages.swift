//
//  PCImages.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

public struct PCImages {
    
    private struct Name {
        static let pcImageLogo = "pcImageLogo"
        static let pcActionCheckmark = "pcActionCheckmark"
        static let pcActionEye = "pcActionEye"
        static let pcActionEyeStrikethrough = "pcActionEyeStrikethrough"
        static let pcFaceLogo = "pcFaceLogo"
        static let pcRememberChecked = "pcRememberChecked"
        static let pcRememberUnchecked = "pcRememberUnchecked"
    }
    
    public static let pcActionCheckmark = UIImage.loadImage(named: Name.pcActionCheckmark)
    public static let pcActionEye = UIImage.loadImage(named: Name.pcActionEye)
    public static let pcActionEyeStrikethrough = UIImage.loadImage(named: Name.pcActionEyeStrikethrough)
    public static let pcFaceLogo = UIImage.loadImage(named: Name.pcFaceLogo)
    public static let pcRememberChecked = UIImage.loadImage(named: Name.pcRememberChecked)
    public static let pcRememberUnchecked = UIImage.loadImage(named: Name.pcRememberUnchecked)
    public static let pcImageLogo = UIImage.loadImage(named: Name.pcImageLogo)
}
