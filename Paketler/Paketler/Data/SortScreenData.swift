//
//  SortScreenData.swift
//  Paketler
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

class SortScreenData{
    static func getData() -> [SortScreenDataModel]{
        var list = [SortScreenDataModel]()
        list.append(SortScreenDataModel.init(title: "Geçerlilik Tarihine Göre", idSort: 1, selected: false))
        list.append(SortScreenDataModel.init(title: "Fiyata Göre Artan", idSort: 2, selected: false))
        list.append(SortScreenDataModel.init(title: "Fiyata Göre Azalan", idSort: 3, selected: false))
        list.append(SortScreenDataModel.init(title: "İnternet Miktarına Göre Artan", idSort: 4, selected: false))
        list.append(SortScreenDataModel.init(title: "İnternet Miktarına Göre Azalan", idSort: 5, selected: false))
        list.append(SortScreenDataModel.init(title: "Konuşma Miktarına Göre Artan", idSort: 6, selected: false))
        list.append(SortScreenDataModel.init(title: "Konuşma Miktarına Göre Azalan", idSort: 7, selected: false))
        list.append(SortScreenDataModel.init(title: "Sms Miktarına Göre Artan", idSort: 8, selected: false))
        list.append(SortScreenDataModel.init(title: "Sms Miktarına Göre Azalan", idSort: 9, selected: false))
        return list
    }
}
