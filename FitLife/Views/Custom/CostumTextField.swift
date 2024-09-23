//
//  CostumTextField.swift
//  FitLife
//
//  Created by Dwistari on 19/08/24.
//

import Foundation
import UIKit

class CostumTextField: UITextField {
    
    var customHeight: CGFloat = 50
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    var icon: UIImage? {
        didSet {
            updateView()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
    }
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: customHeight)
    }
    
    private func updateView() {
        if let iconImage = icon {
            let iconView = UIImageView(image: iconImage)
            iconView.contentMode = .scaleAspectFit
            iconView.frame = CGRect(x: 0, y: 0, width: customHeight, height: customHeight)
            
            leftView = iconView
            leftViewMode = .always
        } else {
            leftView = nil
        }
    }
    
}
