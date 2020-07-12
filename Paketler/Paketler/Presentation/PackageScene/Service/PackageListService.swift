//
//  PackageListService.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation


class PackageListService{
    
    func filter(dataSource:[Package],filterDataModel:[FilterDataModel]?) -> [Package]{
        var filterResult = [Package]()
        var selected = false
        if filterDataModel != nil {
            for item in filterDataModel! {
                if item.selected {
                    selected = true
                    filterResult.append(contentsOf: filter(dataSource: dataSource, idFilter:  item.idFilter))
                    
                }
            }
        }
        if !selected {
            return dataSource
        }
        
        return filterResult
    }
    
    private func filter(dataSource:[Package],idFilter:Int) -> [Package]{
        let now = Date()
        let filterDatas =  dataSource.filter({ item -> Bool in
            let gb = mbToGbInt(data: item.tariff?.data)
            let talk = Int(item.tariff?.talk ?? "0") ?? 0
            let price = item.price ?? 0.0
            let date = msToDate(msDate: item.availableUntil)
            print(date)
            if idFilter == 1{
                return item.subscriptionType == "monthly"
            }else if idFilter == 2{
                return item.subscriptionType == "yearly"
            }else if idFilter == 3{
                return item.subscriptionType == "weekly"
            }else if idFilter == 4{
                return date >= now
            }else if idFilter == 5{
                return gb <= 5
            }else if idFilter == 6{
                return gb > 5 && gb <= 10
            }else if idFilter == 7{
                return gb > 10 && gb <= 20
            }else if idFilter == 8{
                return gb >= 20
            }else if idFilter == 9{
                return talk > 0 && talk <= 500
            }else if idFilter == 10{
                return talk > 500 && talk <= 1000
            }else if idFilter == 11{
                return talk > 1000 && talk <= 2000
            }else if idFilter == 12{
                return price > 0.0 && price <= 50.0
            }else if idFilter == 13{
                return price > 50.0 && price <= 100.0
            }else if idFilter == 14{
                return price > 100.0 && price <= 150.0
            }else if idFilter == 15{
                return price >= 150.0
            }
            
            return false
        })
        
        return filterDatas
    }
    
}
