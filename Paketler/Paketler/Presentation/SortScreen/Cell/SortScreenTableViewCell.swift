//
//  SortScreenTableViewCell.swift
//  Paketler
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import UIKit

class SortScreenTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnRadio: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateRow(model:SortScreenDataModel)  {
        lblTitle.text = model.title
        btnRadio.isSelected = model.selected
    }

}
