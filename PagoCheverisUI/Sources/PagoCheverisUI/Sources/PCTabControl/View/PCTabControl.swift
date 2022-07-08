//
//  PCTabControl.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 8/07/22.
//

import UIKit
import SnapKit

public protocol PCTabControlDelegate: AnyObject {
    
    func didSelect(tab: PCTabItem)
}

public protocol PCTabItem {
    var title: String { get }
}

/// Use to offer navigation between two ore more tabs for content at the same level of hierarchy.
/// *The intrinsic content size height for this object has a value of .*
public class PCTabControl: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    /// Spacing applied to the left and right insets of the collection view.
    private var horizontalPadding: CGFloat = 16
    
    /// Use to manage the tab selection output
    public weak var delegate: PCTabControlDelegate?
    
    /// The tabs to be displayed inside the tab control view.
    private var items: [PCTabItem] = []
    
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    
    // MARK: - Views
    
    private var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .clear
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.register(PCTabCollectionViewCell.self, forCellWithReuseIdentifier: "PCTabCollectionViewCell")
        }
    }
    
    private var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        return flowLayout
    }()
    
    // MARK: - Public methods
    
    public func configure(with items: [PCTabItem]) {
        self.items = items
        collectionView.reloadData()
        setFirstTabSelectedState()
    }
    
    public func setTabsDeselected() {
        guard let selectedIndex = collectionView.indexPathsForSelectedItems?.first else { return }
        collectionView.deselectItem(at: selectedIndex, animated: false)
    }
    
    // MARK: - Private helpers
    
    private func setUpViews() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setFirstTabSelectedState() {
        guard !items.isEmpty else { return }
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
    }
    
    
    // MARK: - CollectionView Protocol
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: horizontalPadding, bottom: 0, right: horizontalPadding)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tabItem = items[indexPath.row]
        delegate?.didSelect(tab: tabItem)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PCTabCollectionViewCell", for: indexPath) as! PCTabCollectionViewCell
        let tabItem = items[indexPath.row]
        cell.configure(with: tabItem)
        
        return cell
    }
}
