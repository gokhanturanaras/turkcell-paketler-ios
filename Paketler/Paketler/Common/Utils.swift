//
//  Utils.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation
import UIKit

func toPriceTL( price:Double , seperator:Bool = true) -> String{
    if price == 0.0 {
        return ""
    }
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = seperator
    currencyFormatter.numberStyle = .currency
    // localize to your grouping and decimal separator
    currencyFormatter.locale = Locale.init(identifier: "tr_TR")
    currencyFormatter.currencySymbol = ""
    // We'll force unwrap with the !, if you've got defined data you may need more error checking
    let priceString = currencyFormatter.string(from: NSNumber.init(value: price))
    
    return "\(priceString!)₺"
}

func mbToGb(data:String?) -> String{
    if data == nil {
        return ""
    }
    guard let mb = Int(data!) else { return "" }
    let gb = mb/1024
    return "\(gb) GB"
}

func mbToGbInt(data:String?) -> Int{
    if data == nil {
        return 0
    }
    guard let mb = Int(data!) else { return 0 }
    let gb = mb/1024
    return gb
}


func msToDate(msDate:String?) -> Date{
    let time = Double(msDate ?? "0") ?? 0.0
    let date = Date(timeIntervalSince1970: time)
    return date
}

func msToStringDate(msDate:String?) -> String{
    let time = Double(msDate ?? "0") ?? 0.0
    let date = Date(timeIntervalSince1970: time)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.string(from: date)
}



func addToolBar(textField: UITextField, selector:Selector?, target:UIViewController,delegate:UITextFieldDelegate){
    let toolBar = UIToolbar()
    toolBar.barStyle = UIBarStyle.default
    toolBar.isTranslucent = true
    //toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
    let doneButton = UIBarButtonItem(title: "Kapat", style: UIBarButtonItem.Style.done, target: target, action: selector)
    
    // var cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "cancelPressed")
    let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    toolBar.setItems([spaceButton, doneButton], animated: false)
    toolBar.isUserInteractionEnabled = true
    toolBar.sizeToFit()
    
    textField.delegate = delegate
    textField.inputAccessoryView = toolBar
}
