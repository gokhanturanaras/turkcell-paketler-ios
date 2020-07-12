//
//  DataService.swift
//  Paketler
//
//  Created by Gökhan on 11.07.2020.
//  Copyright © 2020 Turkcell. All rights reserved.
//

import Foundation

protocol DataService {
    func loadJson() -> PackageModel?
}
