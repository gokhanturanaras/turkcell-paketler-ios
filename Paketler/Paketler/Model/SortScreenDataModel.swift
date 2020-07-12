//
//  SortScreenDataModel.swift
//  Paketler
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

struct SortScreenDataModel {
    var title:String!
    var selected:Bool!
    var idSort:Int!
    
    init(title:String,idSort:Int, selected:Bool) {
        self.title = title
        self.selected = selected
        self.idSort = idSort
    }
}
