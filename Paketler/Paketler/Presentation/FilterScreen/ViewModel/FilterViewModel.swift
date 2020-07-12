//
//  FilterViewModel.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

protocol FilterViewModelInput {
    func load()
    func didSelectFilter(at index:Int)
}

protocol FilterViewModelOutput {
    var dataSource:[FilterDataModel]! { get }
}

protocol FilterViewModelProtocol:FilterViewModelInput,FilterViewModelOutput {}

class FilterViewModel: FilterViewModelProtocol {
    var dataSource: [FilterDataModel]!
    func load() {
        dataSource = FilterData.getData()
    }
    
    func didSelectFilter(at index: Int) {
        dataSource[index].selected = !dataSource[index].selected
    }
        
    
}
