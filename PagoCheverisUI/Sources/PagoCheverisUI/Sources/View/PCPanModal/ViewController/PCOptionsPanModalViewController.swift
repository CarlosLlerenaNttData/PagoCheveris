//
//  File.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 15/07/22.
//

import UIKit

public protocol PCOptionsPanModalDelegate: AnyObject {
    
    func didSelect(selectedOption: PCPanModalOption)
}

public protocol PCPanModalOption {
    var title: String { get }
}

class PCOptionsPanModalViewController: UIViewController, PCPanModalPresentable {
    
    // MARK: - Properties
    
    var layoutIsReady: Bool = false
    var showDragIndicator: Bool = false
    var panScrollable: UIScrollView?
    
    var selectedOption: PCPanModalOption!
    
    public weak var delegate: PCOptionsPanModalDelegate?
    
    var longFormHeight: PCPanModalHeight {
        if layoutIsReady {
            return .contentHeight(containerView.frame.size.height)
        }
        return .contentHeight(300)
    }
    
    var optionsList: [PCPanModalOption] = [] {
        didSet {
            optionTableView.reloadData()
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = PCColors.viewBackground1
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = PCColors.labelQuinary
            titleLabel.font = PCFont.medium14
        }
    }
    
    @IBOutlet weak var primaryButton: PCButtonPrimary! {
        didSet {
            primaryButton.isEnabled = false
            primaryButton.setTitle("Aceptar", for: .normal)
        }
    }
    
    @IBOutlet weak var optionTableView: UITableView! {
        didSet {
            optionTableView.delegate = self
            optionTableView.dataSource = self
            optionTableView.register(UINib(nibName: "BiBOptionCell", bundle: Bundle.module), forCellReuseIdentifier: "BiBOptionCell")
            optionTableView.backgroundColor = PCColors.viewBackground2
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func primaryButton(_ sender: PCButtonPrimary) {
        dismiss(animated: true) { [weak self] in
            guard let selectedOption = self?.selectedOption else { return }
            self?.delegate?.didSelect(selectedOption: selectedOption)
        }
    }
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = PCColors.viewBackground1
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layoutIsReady = true
        panModalSetNeedsLayoutUpdate()
        panModalTransition(to: .longForm)
    }
}

// MARK: TableView Delegate & Data source

extension PCOptionsPanModalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        optionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PCOptionCell", for: indexPath) as! PCOptionCell
        
        let option = optionsList[indexPath.row]
        cell.configure(option: option)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        primaryButton.isEnabled = true
        selectedOption = optionsList[indexPath.row]
    }
}
