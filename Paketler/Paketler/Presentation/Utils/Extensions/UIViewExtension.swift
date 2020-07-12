//
//  UIViewExtension.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil)
    }

    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
           DispatchQueue.main.async {
                     let path = UIBezierPath(roundedRect: self.bounds,
                                             byRoundingCorners: corners,
                                             cornerRadii: CGSize(width: radius, height: radius))
                     let maskLayer = CAShapeLayer()
                     maskLayer.frame = self.bounds
                     maskLayer.path = path.cgPath
                     self.layer.mask = maskLayer
                 }
       }
}
