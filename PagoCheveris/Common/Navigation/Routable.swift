//
//  Routable.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

protocol Routable {
    
    func pushViewController(withIdentifer identifier: String, in storyBoard: UIStoryboard.Storyboard, from viewController: UIViewController)
    
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void)

    func present<T: UIViewController>(withIdentifier identifier: String,
                                      type: T.Type,
                                      in storyboard: UIStoryboard.Storyboard,
                                      from viewController: UIViewController,
                                      shouldBlockSwipeDown: Bool,
                                      shouldShowInFullScreen: Bool,
                                      shouldAnimate: Bool,
                                      presentationMode: UIModalPresentationStyle?,
                                      moduleConfiguration: (T) -> Void)
    
    func replaceRoot<T: UIViewController>(withIdentifier identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void)
}

extension Routable {
    
    /**
     Protocol used to push a ViewController to a new ViewController in a different StoryBoard without adding a NavigationController.
     
     ## Important Notes ##
     1. The Origin ViewController must be embedded in a NavigationController
     
     ### Usage Example: ###
     ````
     
     extension ModuleRouter: Routable {
     
        func navigateToViewController(withIdentifer identifier: String, storyBoard: UIStoryboard.Storyboard) {
            pushViewController(withIdentifer: identifier, in: storyBoard, from: viewController)
        }
     }
     
     ````
     */
    func pushViewController(withIdentifer identifier: String, in storyBoard: UIStoryboard.Storyboard, from viewController: UIViewController) {
        let storyBoard = UIStoryboard.storyboard(storyBoard)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func pushViewController<T: UIViewController>(withIdentifer identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        let storyBoard = UIStoryboard.storyboard(storyBoard, bundle: bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        
        moduleConfiguration(nextViewController)
        viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func present<T: UIViewController>(withIdentifier identifier: String,
                                      type: T.Type,
                                      in storyboard: UIStoryboard.Storyboard,
                                      from viewController: UIViewController,
                                      shouldBlockSwipeDown: Bool = false,
                                      shouldShowInFullScreen: Bool = false,
                                      shouldAnimate: Bool = true,
                                      presentationMode: UIModalPresentationStyle? = nil,
                                      moduleConfiguration: (T) -> Void) {
        
        let bundle = Bundle(for: type)
        let storyboard = UIStoryboard.storyboard(storyboard, bundle: bundle)
        let nextViewController  = storyboard.instantiateViewController(withIdentifier: identifier) as! T
        
        let navigationController = UINavigationController(rootViewController: nextViewController)
        
        if #available(iOS 13.0, *) {
            navigationController.isModalInPresentation = shouldBlockSwipeDown
        }
        
        if shouldShowInFullScreen {
            navigationController.modalPresentationStyle = .fullScreen
        }
        
        if let presentationMode = presentationMode {
            navigationController.modalPresentationStyle = presentationMode
        }
        
        moduleConfiguration(nextViewController)
        viewController.present(navigationController, animated: shouldAnimate)
    }
    
    func replaceRoot<T: UIViewController>(withIdentifier identifier: String,
                                                 type: T.Type,
                                                 in storyBoard: UIStoryboard.Storyboard,
                                                 from viewController: UIViewController,
                                                 moduleConfiguration: (T) -> Void) {
        let bundle = Bundle(for: type)
        let storyBoard = UIStoryboard.storyboard(storyBoard, bundle: bundle)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: identifier) as! T
        let viewControllers =  [nextViewController]
        
        moduleConfiguration(nextViewController)
        viewController.navigationController?.setViewControllers(viewControllers, animated: true)
    }
}
