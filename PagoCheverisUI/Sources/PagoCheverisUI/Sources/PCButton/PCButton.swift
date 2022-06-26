//
//  PCButton.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 24/06/22.
//

import UIKit

/**
 A PCButton object is a button that shows a plain button style. Override the method `setAppearance()` to make display changes. You typically use this class the same way you use UIButton.
*/
public class PCButton: UIButton {
    
    // MARK: - Properties
    
    private var cornerRadius: CGFloat = 15
    private var font: UIFont = PCFont.bold15
    private var imagePadding: CGFloat = 10.0
    
    
    // MARK: Init
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setAppearance()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setAppearance()
    }
    
    
    // MARK: Appearance
    
    func setAppearance() {
        configuration = UIButton.Configuration.plain()
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        configuration?.imagePadding = imagePadding
        configuration?.titleTextAttributesTransformer =
        UIConfigurationTextAttributesTransformer { [weak self]  incoming in
            guard let self = self else { return incoming }
            var outgoing = incoming
            outgoing.font = self.font
            return outgoing
          }
    }
}
