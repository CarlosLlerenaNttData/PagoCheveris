//
//  PCAlertPanModalViewController.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 26/06/22.
//

import UIKit

class PCAlertPanModalViewController: UIViewController, PCPanModalPresentable {
    
    // MARK: - Properties
    
    var layoutIsReady: Bool = false
    var showDragIndicator: Bool = false
    var allowsDragToDismiss: Bool = false
    var allowsTapToDismiss: Bool = false
    var panScrollable: UIScrollView?
    
    var longFormHeight: PCPanModalHeight {
        if layoutIsReady {
            return .contentHeight(containerView.frame.size.height)
        }
        
        return .contentHeight(185)
    }
    
    var primaryAction: PCPanModalAction! {
        didSet {
            primaryButton.setImage(primaryAction.icon, for: .normal)
            primaryButton.setTitle(primaryAction.title, for: .normal)
        }
    }
    
    var secondaryAction: PCPanModalAction? {
        didSet {
            secondaryButton?.setImage(secondaryAction?.icon, for: .normal)
            secondaryButton?.setTitle(secondaryAction?.title, for: .normal)
        }
    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = PCColors.viewBackground1
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel? {
        didSet {
            titleLabel?.textColor = PCColors.labelPrimary
            titleLabel?.font = PCFont.semiBold24
        }
    }
    
    @IBOutlet weak var messageLabel: UILabel! {
        didSet {
            messageLabel.textColor = PCColors.labelQuaternary
            messageLabel.font = PCFont.semiBold16
        }
    }
    
    @IBOutlet weak var secondaryButton: PCButtonSecondary?
    @IBOutlet weak var primaryButton: PCButtonPrimary!
    @IBOutlet weak var iconImageView: UIImageView?
    
    // MARK: - IBActions
    
    @IBAction func primaryButton(_ sender: PCButtonPrimary) {
        dismiss(animated: true) { [weak self] in
            self?.primaryAction.action?()
        }
    }
    
    
    @IBAction func secondaryButton(_ sender: PCButtonSecondary) {
        dismiss(animated: true) { [weak self] in
            self?.secondaryAction?.action?()
        }
    }
    
    
    // MARK: - Overrides
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutIsReady = true
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .longForm)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PCColors.viewBackground1
    }
    
}
