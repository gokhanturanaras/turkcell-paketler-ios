//
//  FilterDataModel.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

struct FilterDataModel {
    var cellType:CellType!
    var title:String!
    var selected:Bool!
    var idFilter:Int!
    
    init(cellType:CellType, title:String,idFilter:Int? = 0, selected:Bool? = false) {
        self.cellType = cellType
        self.title = title
        self.selected = selected
        self.idFilter = idFilter
    }
}


enum CellType{
    case TITLE
    case CONTENT
}
