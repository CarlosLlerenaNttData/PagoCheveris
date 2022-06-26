//
//  StoryboardIdentifiable.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

/**
 Adds The property storyboardIdentifier to all ViewControllers that conform to this protocol inside the app
 
 ## Important Notes ##
 1. Definition of the reuseIdentifier in the storyboard must match the Name of the Class of the ViewController. Case sensitive
 
 ### Usage Example: ###
 ````
 NameViewController.storyboardIdentifier
 
 ````
 */
protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: Self.self)
    }
}
