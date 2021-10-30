//
//  CurrencyModel.swift
//  MileageConverter
//
//  Created by Christian Regul on 5/21/21.
//  Copyright © 2021 Christian Regul. All rights reserved.
//

import Foundation

struct CurrencyModel {
    let rate: Double
    
    var rateString: String {
        return String(format: "%.2f", rate)
    }
}
