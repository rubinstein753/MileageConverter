//
//  CurrencyData.swift
//  MileageConverter
//
//  Created by Christian Regul on 5/21/21.
//  Copyright © 2021 Christian Regul. All rights reserved.
//

import Foundation

struct CurrencyData: Codable {
    let conversion_rates: Rates
    
}

struct Rates: Codable {
    let CAD: Double
}
