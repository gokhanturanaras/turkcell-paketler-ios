//
//  SortScreenViewModel.swift
//  Paketler
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

protocol SortScreenViewModelInput {
    func load()
    func didSelectSort(at index:Int)
}

protocol SortScreenViewModelOutput {
    var dataSource:[SortScreenDataModel]! { get }
}

protocol SortScreenViewModelProtocol:SortScreenViewModelInput,SortScreenViewModelOutput {}

class SortScreenViewModel: SortScreenViewModelProtocol {
    var dataSource: [SortScreenDataModel]!
    func load() {
        dataSource = SortScreenData.getData()
    }
    
    func didSelectSort(at index: Int) {
        for i in 0..<dataSource.count{
            dataSource[i].selected = false
        }
        dataSource[index].selected = !dataSource[index].selected
        if dataSource[index].selected {
            Constants.SELECTED_SORT_ID = dataSource[index].idSort
        }else{
            Constants.SELECTED_SORT_ID = nil
        }
    }
        
    
}
