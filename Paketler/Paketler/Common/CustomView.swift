//
//  CustomView.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

import UIKit

class CustomView: UIView {
    private var shadowLayer: CAShapeLayer!
    
    @IBInspectable var layerCorner: Bool = false
    @IBInspectable var layerRadius: CGFloat = 6.0
    @IBInspectable var border: Bool = false
    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var borderColor: UIColor = Colors.BLACK_BORDER

    @IBInspectable var cornerRadius: CGFloat = 17.0
    @IBInspectable var customCorner: Bool = false
    @IBInspectable var allCorners: Bool = false
    @IBInspectable var bottomLeft: Bool = false
    @IBInspectable var bottomRight: Bool = false
    @IBInspectable var topLeft: Bool = false
    @IBInspectable var topRight: Bool = false
    @IBInspectable var cornerShadow: Bool = false
    @IBInspectable var fillColor: UIColor = Colors.VIEW_BACKGROUND
    @IBInspectable var shadowColor: UIColor = Colors.SHADOW_COLOR
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        setupUI()
    }
    
    
    func setupUI()  {
        createBorder()
        createLayerCorner()
        createCustomCorner()
        createShadow()
    }
    
    
    private func createBorder(){
        if border {
            layer.borderWidth = borderWidth
            layer.borderColor = borderColor.cgColor
        }
    }
    private func createLayerCorner(){
        if layerCorner {
            layer.cornerRadius = layerRadius
            layer.masksToBounds = true
        }
    }
    
    private func createShadow() {
        if cornerShadow{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = false
            if shadowLayer == nil {
                shadowLayer = CAShapeLayer()
                shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
                shadowLayer.fillColor = fillColor.cgColor
                shadowLayer.shadowColor = shadowColor.cgColor
                shadowLayer.shadowPath = shadowLayer.path
                shadowLayer.shadowOffset = CGSize(width: 0.0, height: 3.0)
                shadowLayer.shadowOpacity = 0.31
                shadowLayer.shadowRadius = 5
                layer.insertSublayer(shadowLayer, at: 0)
            }
        }
    }
    
    
    private func createCustomCorner(){
        if customCorner {
            layer.masksToBounds = true
            self.roundCorners(corners: getCorners(), radius: cornerRadius)
        }
    }
    
    private func getCorners() -> UIRectCorner{
        var corners: UIRectCorner = []
        
        if allCorners {
            corners.insert(.allCorners)
        }else{
            if bottomLeft {
                corners.insert(.bottomLeft)
            }
            if bottomRight {
                corners.insert(.bottomRight)
            }
            if topLeft {
                corners.insert(.topLeft)
            }
            if topRight {
                corners.insert(.topRight)
            }
        }
        
        return corners
    }
    
}
