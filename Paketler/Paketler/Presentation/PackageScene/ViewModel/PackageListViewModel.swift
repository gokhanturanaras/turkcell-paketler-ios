//
//  PackageListViewModelProtocol.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

protocol PackageListViewModelInput {
    func load()
    func didSelectFavorite(at index:Int)
    func didInfoSelect(at index:Int)
    func didCancelInfo(at index: Int)
    func didSearch(query: String)
    func didCancelSearch()
    func showFilter(filterDataModel:[FilterDataModel]?)
    func showSort(idSort:Int)
    func showSortDefault()
    
}

protocol PackageListViewModelOutput {
    var items:PackageModel! { get }
}

protocol PackageListViewModelProtocol:PackageListViewModelInput,PackageListViewModelOutput {}

final class PackageListViewModel:PackageListViewModelProtocol {
    
    private let packageData:DataService!
    var items: PackageModel!
    let defaults = UserDefaults.standard
    
    init(packageData:DataService) {
        self.packageData = packageData
    }
    
    func load() {
        guard let jsonData = self.packageData.loadJson() else {return}
        self.items = jsonData
    }
    
    func didSelectFavorite(at index: Int) {
        self.items.packages![index].favorite = !(self.items.packages![index].favorite ?? false)
        defaults.set(self.items.packages![index].favorite, forKey:  self.items.packages![index].name!)
        
        
    }
    
    func didInfoSelect(at index: Int) {
        self.items.packages![index].info = true
    }
    
    func didCancelInfo(at index: Int) {
        self.items.packages![index].info = false
    }
    
    func didSearch(query: String) {
        load()
        let sortPackages = self.items.packages
        let searchResult = sortPackages?.filter({ item -> Bool in
            return (item.name?.uppercased().contains(query.uppercased()) ?? false)
        })
        self.items.packages = searchResult
        
    }
    
    func didCancelSearch() {
        load()
    }
    
    func showFilter(filterDataModel:[FilterDataModel]?) {
        self.items.packages =  callFilter(data: self.items,filterDataModel: filterDataModel)
        
    }
    
    func showSort(idSort:Int) {
        var sortPackages = self.items.packages
        sortPackages?.sort(by: { (item1, item2) -> Bool in
            if idSort == 1{
                let date1 = msToDate(msDate: item1.availableUntil)
                let date2 = msToDate(msDate: item2.availableUntil)
                
                return date1 > date2
            }else if idSort == 2{
                let price1 = item1.price ?? 0
                let price2 = item2.price ?? 0
                
                return price1 <= price2
            }else if idSort == 3{
                let price1 = item1.price ?? 0
                let price2 = item2.price ?? 0
                
                return price1 >= price2
            }else if idSort == 4{
                let data1 = mbToGbInt(data: item1.tariff?.data)
                let data2 = mbToGbInt(data: item2.tariff?.data)
                
                return data1 < data2
            }else if idSort == 5{
                let data1 = mbToGbInt(data: item1.tariff?.data)
                let data2 = mbToGbInt(data: item2.tariff?.data)
                
                return data1 > data2
            }else if idSort == 6{
                let talk1 = Int(item1.tariff?.talk ?? "0") ?? 0
                let talk2 = Int(item2.tariff?.talk ?? "0") ?? 0
                
                return talk1 < talk2
            }else if idSort == 7{
                let talk1 = Int(item1.tariff?.talk ?? "0") ?? 0
                let talk2 = Int(item2.tariff?.talk ?? "0") ?? 0
                
                return talk1 > talk2
            }else if idSort == 8{
                let sms1 = Int(item1.tariff?.sms ?? "0") ?? 0
                let sms2 = Int(item2.tariff?.sms ?? "0") ?? 0
                
                return sms1 < sms2
            }else if idSort == 9{
                let sms1 = Int(item1.tariff?.sms ?? "0") ?? 0
                let sms2 = Int(item2.tariff?.sms ?? "0") ?? 0
                
                return sms1 > sms2
            }
            
            return false
        })
        
        self.items.packages = sortPackages
    }
    
    func showSortDefault() {
        var sortPackages = self.items.packages
        sortPackages?.sort(by: { (item1, item2) -> Bool in
            let date1 = msToDate(msDate: item1.availableUntil)
            let date2 = msToDate(msDate: item2.availableUntil)
            return date1 > date2
            
        })
        
        for i in 0..<sortPackages!.count {
            let favorite = UserDefaults.standard.bool(forKey: sortPackages![i].name!)
            sortPackages![i].favorite = favorite
        }
        sortPackages = sortPackages!.sorted{($0.favorite ?? false) && !($1.favorite ?? false) }
        
        
        
        self.items.packages = sortPackages
    }
    
    private func callFilter(data: PackageModel,filterDataModel:[FilterDataModel]?) -> [Package] {
        let filterService = PackageListService()
        return  filterService.filter(dataSource: data.packages!,filterDataModel: filterDataModel)
    }
    
    
}
