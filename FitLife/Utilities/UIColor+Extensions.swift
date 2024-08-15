//
//  UIColor+Extensions.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit

extension UIColor {
    
    static func gradientLayer(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) -> CAGradientLayer {
         let gradientLayer = CAGradientLayer()
         gradientLayer.colors = colors.map { $0.cgColor }
         gradientLayer.startPoint = startPoint
         gradientLayer.endPoint = endPoint
         return gradientLayer
     }
    
    // Initialize UIColor with a hex string
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        // Remove any leading hash symbol
        let cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let hexString: String
        
        if cleanedHex.hasPrefix("#") {
            hexString = String(cleanedHex.dropFirst())
        } else {
            hexString = cleanedHex
        }

        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
