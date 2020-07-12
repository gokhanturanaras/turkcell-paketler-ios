//
//  CustomTextField.swift
//  Paketler
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    
    @IBInspectable var placeHolderColor:UIColor = UIColor.black
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                               attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor])
    }
    

}

