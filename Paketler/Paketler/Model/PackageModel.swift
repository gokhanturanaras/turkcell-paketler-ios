//
//  Packages.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

// MARK: - Packages
public struct PackageModel: Codable {
    public var packages: [Package]?

    enum CodingKeys: String, CodingKey {
        case packages = "packages"
    }

    public init(packages: [Package]?) {
        self.packages = packages
    }
}

// MARK: - Package
public struct Package: Codable {
    public let name: String?
    public let desc: String?
    public let subscriptionType: String?
    public let didUseBefore: Bool?
    public let benefits: [String]?
    public let price: Double?
    public var tariff: Tariff?
    public let availableUntil: String?
    public var favorite:Bool?
    public var info:Bool?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
        case subscriptionType = "subscriptionType"
        case didUseBefore = "didUseBefore"
        case benefits = "benefits"
        case price = "price"
        case tariff = "tariff"
        case availableUntil = "availableUntil"
    }

    public init(name: String?, desc: String?, subscriptionType: String?, didUseBefore: Bool?, benefits: [String]?, price: Double?, tariff: Tariff?, availableUntil: String?,favorite:Bool?,info:Bool?) {
        self.name = name
        self.desc = desc
        self.subscriptionType = subscriptionType
        self.didUseBefore = didUseBefore
        self.benefits = benefits
        self.price = price
        self.tariff = tariff
        self.availableUntil = availableUntil
        self.favorite = favorite
        self.info = info
    }
}

// MARK: - Tariff
public struct Tariff: Codable {
    public let data: String?
    public let talk: String?
    public let sms: String?

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case talk = "talk"
        case sms = "sms"
    }

    public init(data: String?, talk: String?, sms: String?) {
        self.data = data
        self.talk = talk
        self.sms = sms
    }
}
