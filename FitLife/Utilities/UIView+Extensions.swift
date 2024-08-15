//
//  UIView+Extensions.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit

extension UIView {
    
    func applyGradient(startPoint: CGPoint = CGPoint(x: 0, y: 0), endPoint: CGPoint = CGPoint(x: 1, y: 1)) {
           // Remove any existing gradient layers
           self.layer.sublayers?.removeAll { $0 is CAGradientLayer }
           
           // Create and configure the gradient layer
        let gradientLayer = UIColor.gradientLayer(colors: [UIColor(hex: "#92A3FD"), UIColor(hex: "#9DCEFF")], startPoint: startPoint, endPoint: endPoint)
           gradientLayer.frame = self.bounds
           
           // Add the gradient layer to the view's layer
           self.layer.insertSublayer(gradientLayer, at: 0)
       }
}
