//
//  PackageTableViewCell.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import UIKit

class PackageTableViewCell: UITableViewCell {
    @IBOutlet weak var lblPackageName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSubscriptionType: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var contentLine1: UIView!
    @IBOutlet weak var contentLine2: UIView!
    @IBOutlet weak var viewInternet: UIView!
    @IBOutlet weak var viewMinutes: UIView!
    @IBOutlet weak var viewSms: UIView!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblDk: UILabel!
    @IBOutlet weak var lblSms: UILabel!
    @IBOutlet weak var imgFavorite: UIImageView!
    
    @IBOutlet weak var viewInternetHeight: NSLayoutConstraint!
    @IBOutlet weak var viewMinutesHeight: NSLayoutConstraint!
    @IBOutlet weak var viewSmsHeight: NSLayoutConstraint!

    @IBOutlet weak var cnsTopPackageName: NSLayoutConstraint!
    @IBOutlet weak var lblDidUseBefore: UILabel!
    
    @IBOutlet weak var viewDetail: CustomView!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var lblPackageDetail: UILabel!
    @IBOutlet weak var lblAvabiltyDate: UILabel!
    @IBOutlet weak var btnDetailClose: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
