//
//  UITableView+Extensions.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 8/07/22.
//

import UIKit

extension UITableViewCell: ReusableViewIdentifier, NibLoadableView {}
extension UITableViewHeaderFooterView: ReusableViewIdentifier, NibLoadableView {}

extension UITableView {

    /**
     This function lets you register nibs in a simplified way.
     
     - Parameter UITableViewCell: Cell To Register.
     
     ## Important Notes ##
     1. View Most conform to ReusableViewIdentifier, NibLoadableView
     
     ### Usage Example: ###
     ````
     extension ViewCell: ReusableViewIdentifier, NibLoadableView {}
     
     tableView.register(ViewCell.self)
     ````
     */
    func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    /**
     This function lets you dequeue Cells with a guard to make sure you are able to find it.
     
     - Parameter IndexPath.
     
     ## Important Notes ##
     1. View must conform to ReusableViewIdentifier
     
     ### Usage Example: ###
     ````
     extension ViewCell: ReusableViewIdentifier
     
     tableView.dequeueReusableCell(forIndexPath: indexPath) as NameTableViewCell
     ````
     */
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            preconditionFailure("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
