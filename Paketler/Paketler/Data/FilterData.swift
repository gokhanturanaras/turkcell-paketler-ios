//
//  FilterData.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation


class FilterData{
    static func getData() -> [FilterDataModel]{
        var list = [FilterDataModel]()
        list.append(FilterDataModel.init(cellType: .TITLE, title: "Abonelik Türü"))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "Aylık", idFilter: FilterIds.AYLIK.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "Yıllık", idFilter: FilterIds.YILLIK.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "Haftalık", idFilter: FilterIds.HAFTALIK.id, selected: false))
        
        list.append(FilterDataModel.init(cellType: .TITLE, title: "Geçerlilik Tarihine Göre"))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "Devam Edenler", idFilter: FilterIds.DEVAM_EDENLER.id, selected: false))
        
        list.append(FilterDataModel.init(cellType: .TITLE, title: "İnternet Miktarına Göre"))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "0 - 5 GB", idFilter: FilterIds.SIFIR_5_GB.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "5 - 10 GB", idFilter: FilterIds.BES_10_GB.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "10 - 20 GB", idFilter: FilterIds.ON_20_GB.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "20 GB ve Üzeri", idFilter: FilterIds.YIRMI_UZERI.id, selected: false))
        
        list.append(FilterDataModel.init(cellType: .TITLE, title: "Dakikaya Göre"))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "0 - 500 DK", idFilter: FilterIds.SIFIR_500_DK.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "500 - 1000 DK", idFilter: FilterIds.BES_YUZ_1000_DK.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "1000 - 2000 DK", idFilter: FilterIds.BIN_2000_DK.id, selected: false))
        
        list.append(FilterDataModel.init(cellType: .TITLE, title: "Paket Fiyatına Göre"))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "0 - 50 TL", idFilter: FilterIds.SIFIR_50_TL.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "50 - 100 TL", idFilter: FilterIds.ELLI_100_TL.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "100 - 150 TL", idFilter: FilterIds.YUZ_150_TL.id, selected: false))
        list.append(FilterDataModel.init(cellType: .CONTENT, title: "150 TL ve Üzeri", idFilter: FilterIds.YUZ_ELLI_UZERI_TL.id, selected: false))
        return list
    }
}


public enum FilterIds{
    case AYLIK
    case YILLIK
    case HAFTALIK
    case DEVAM_EDENLER
    case SIFIR_5_GB
    case BES_10_GB
    case ON_20_GB
    case YIRMI_UZERI
    case SIFIR_500_DK
    case BES_YUZ_1000_DK
    case BIN_2000_DK
    case SIFIR_50_TL
    case ELLI_100_TL
    case YUZ_150_TL
    case YUZ_ELLI_UZERI_TL
    
    
    var id: Int {
        switch self {
        case .AYLIK:
            return 1
        case .YILLIK:
            return 2
        case .HAFTALIK:
            return 3
        case .DEVAM_EDENLER:
            return 4
        case .SIFIR_5_GB:
            return 5
        case .BES_10_GB:
            return 6
        case .ON_20_GB:
            return 7
        case .YIRMI_UZERI:
            return 8
        case .SIFIR_500_DK:
            return 9
        case .BES_YUZ_1000_DK:
            return 10
        case .BIN_2000_DK:
            return 11
        case .SIFIR_50_TL:
            return 12
        case .ELLI_100_TL:
            return 13
        case .YUZ_150_TL:
            return 14
        case .YUZ_ELLI_UZERI_TL:
            return 15
        }
    }
    
}

