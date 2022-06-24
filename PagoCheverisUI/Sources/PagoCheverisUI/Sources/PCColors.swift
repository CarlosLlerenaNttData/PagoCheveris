//
//  PCColors.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 22/06/22.
//

import UIKit

public struct PCColors {
    
    // MARK: - NAME
    
    struct Name {
        static let error = "error"
        static let success = "success"
        static let warning = "warning"
        
        static let buttonPrimary = "buttonPrimary"
        static let buttonSecondary = "buttonSecondary"
        static let buttonTertiary = "buttonTertiary"
        static let buttonQuaternary = "buttonQuaternary"
        static let buttonDisabled = "buttonDisabled"
        static let buttonLightContent = "buttonLightContent"
        
        static let grabberView = "grabberView"
        
        static let labelPrimary = "labelPrimary"
        static let labelSecondary = "labelSecondary"
        static let labelTertiary = "labelTertiary"
        static let labelQuaternary = "labelQuaternary"
        static let labelQuinary = "labelQuinary"
        static let labelLight = "labelLight"
        
        static let progressViewTrack = "progressViewTrack"
        
        static let textFieldText = "textFieldText"
        static let textFieldPlaceholder = "textFieldPlaceholder"
        static let textFieldTint = "textFieldTint"
        static let textFieldActivatedOutline = "textFieldActivatedOutline"
        static let textFieldFocusedOutline = "textFieldFocusedOutline"
        static let textFieldInactiveOutline = "textFieldInactiveOutline"
        
        static let tabBarTint = "tabBarTint"
        
        static let tintedNavigationBar = "tintedNavigationBar"
        static let tintedNavigationBarItem = "tintedNavigationBarItem"
        
        static let viewBackground1 = "viewBackground1"
        static let viewBackground2 = "viewBackground2"
    }
    
    
    // MARK: - COLORS
    
    /// The tint color for a view that displays an *error* state.
    public static let error = UIColor.loadColor(named: Name.error)
    
    /// The tint color for a view that displays a *success* state.
    public static let success = UIColor.loadColor(named: Name.success)
    
    /// The tint color for a view that displays a *warning* state.
    public static let warning = UIColor.loadColor(named: Name.warning)
    
    /// The color for buttons with primary funcionality.
    public static let buttonPrimary = UIColor.loadColor(named: Name.buttonPrimary)
    
    /// The color for buttons with secondary funcionality.
    public static let buttonSecondary = UIColor.loadColor(named: Name.buttonSecondary)

    /// The color for buttons with tertiary funcionality.
    public static let buttonTertiary = UIColor.loadColor(named: Name.buttonTertiary)
    
    /// The color for buttons with quaternary  funcionality.
    public static let buttonQuaternary = UIColor.loadColor(named: Name.buttonQuaternary)
    
    /// The color for buttons on a disabled state.
    public static let buttonDisabled = UIColor.loadColor(named: Name.buttonDisabled)
    
    /// The text color for a button with a tinted background.
    public static let buttonLightContent = UIColor.loadColor(named: Name.buttonLightContent)
    
    /// The background color for a grabber view.
    public static let grabberView = UIColor.loadColor(named: Name.grabberView)
    
    /// The color for text labels that contain primary content.
    public static let labelPrimary = UIColor.loadColor(named: Name.labelPrimary)
    
    /// The color for text labels that contain secondary content.
    public static let labelSecondary = UIColor.loadColor(named: Name.labelSecondary)
    
    /// The color for text labels that contain tertiary content.
    public static let labelTertiary = UIColor.loadColor(named: Name.labelTertiary)
    
    /// The color for text labels that contain quaternary content.
    public static let labelQuaternary = UIColor.loadColor(named: Name.labelQuaternary)
    
    /// The color for text labels that contain quinary content.
    public static let labelQuinary = UIColor.loadColor(named: Name.labelQuinary)
    
    /// The color for text labels on a tinted background.
    public static let lightLabel = UIColor.loadColor(named: Name.labelLight)
    
    /// The color shown for the portion of the progress bar that is not filled.
    public static let progressViewTrack = UIColor.loadColor(named: Name.progressViewTrack)
    
    /// The color for the text in a textField.
    public static let textFieldText = UIColor.loadColor(named: Name.textFieldText)
    
    /// The text color for the placeholder in a textField.
    public static let textFieldPlaceholder = UIColor.loadColor(named: Name.textFieldPlaceholder)
    
    /// The color for the `tintColor` property of a textField.
    public static let textFieldTint = UIColor.loadColor(named: Name.textFieldTint)
    
    /// The outline color for a PCTextField in an activated state.
    public static let textFieldActivatedOutline = UIColor.loadColor(named: Name.textFieldActivatedOutline)
    
    /// The outline color for a PCTextField in a focused state.
    public static let textFieldFocusedOutline = UIColor.loadColor(named: Name.textFieldFocusedOutline)
    
    /// The outline color for a PCTextField in an inactive state.
    public static let textFieldInactiveOutline = UIColor.loadColor(named: Name.textFieldInactiveOutline)
    
    /// The tint color for a tab bar item.
    public static let tabBarTint = UIColor.loadColor(named: Name.tabBarTint)
    
    /// The background color for a tinted navigation bar.
    public static let tintedNavigationBar = UIColor.loadColor(named: Name.tintedNavigationBar)
    
    /// The color for a navigation bar item on a tinted navigation bar.
    public static let tintedNavigationBarItem = UIColor.loadColor(named: Name.tintedNavigationBarItem)
    
    /// The primary background color for a container view.
    public static let viewBackground1 = UIColor.loadColor(named: Name.viewBackground1)
    
    /// The secondary background color for a container view.
    public static let viewBackground2 = UIColor.loadColor(named: Name.viewBackground2)
}
