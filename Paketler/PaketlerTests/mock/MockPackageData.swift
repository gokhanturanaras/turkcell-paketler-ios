//
//  MockPackageData.swift
//  PaketlerTests
//
//  Created by Gökhan on 12.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation
@testable import Paketler

class MockPackageData: DataService{
    
    let packageModel: PackageModel = {
        var packages = [Package]()
        packages.append(Package.init(name: "Platinum Maksi 6 GB", desc: "Zengin içerikli Platinum Maksi Paketi ile Turkcell Uygulamalarının keyfini sürün!", subscriptionType: "monthly", didUseBefore: true, benefits: ["lifebox","Platinum"], price: 109.90, tariff: Tariff(data: "6144", talk: "2000", sms: "100"), availableUntil: "1558131150", favorite: false, info: true))
        packages.append(Package.init(name: "Platinum Maksi 8 GB", desc: "Zengin içerikli Platinum Maksi Paketi ile Turkcell Uygulamalarının keyfini sürün!", subscriptionType: "monthly", didUseBefore: true, benefits: ["lifebox","Platinum"], price: 129.90, tariff: Tariff(data: "8192", talk: "2000", sms: "100"), availableUntil: "1580433810", favorite: true, info: false))
        packages.append(Package.init(name: "Uçuran 4 GB Paketi", desc: "Hazır Kart Üçlü Paketler Kampanyası kapsamında sunulan Uçuran 4 GB Paketi ile sadece 45 TL'ye 4 GB internetin keyfini sürebilir, sevdiklerinizle tam 500 dakika konuşup, 1000 SMS atabilirsiniz. BiP ile ücretsiz mesajlaşabilir, BiP’te geçerli 1 GB internet ile sevdiklerinizi ister sesli ister görüntülü ücretsiz olarak arayabilirsiniz.", subscriptionType: "yearly", didUseBefore: true, benefits: ["Dergilik","BiP"], price: 45, tariff: Tariff(data: "4096", talk: "500", sms: "1000"), availableUntil: "1580433810", favorite: false, info: false))
        packages.append(Package.init(name: "Akıllı Fatura 500 Dakika Paketi", desc: "Akıllı Fatura Kampanyası ile paket bitiminden sonra Akıllı Fatura Ek Paketi alarak kullanıma devam edebilirsiniz.", subscriptionType: "weekly", didUseBefore: true, benefits: ["Fizy","BiP"], price: 19, tariff: Tariff(data: "0", talk: "500", sms: "0"), availableUntil: "1563758610", favorite: false, info: false))
        let packageModel = PackageModel(packages: packages)
        
        return packageModel
    }()
    
    func loadJson() -> PackageModel? {
        return packageModel
    }
    
}

