//
//  Conversion.swift
//  MileageConverter
//
//  Created by Christian Regul on 3/11/21.
//  Copyright © 2021 Christian Regul. All rights reserved.
//

import Foundation

struct Conversion {
    
    var currencyManager = CurrencyManager()
    
    func convertToLPH(mpg: String) -> String {
        if let floatMpg = Float(mpg) {
        let result1 = 235.21505710415449 / floatMpg
        let stringResult1 = String(format: "%.1f", result1)
        
        return stringResult1
        } else {
            return ""
        }
         
    }
    
    func convertToMPG(ltsp100: String) -> String {
        if let floatLtsp100 = Float(ltsp100) {
            let result2 = 235.21505710415449 / floatLtsp100
            let stringResult2 = String(format: "%.1f", result2)
            
            return stringResult2
        }
        else {
            return ""
        }
    }
    
    func convertToLiters(gallons: String) -> String {
        if let floatGallons = Float(gallons) {
            let result3 = floatGallons * 3.78541
            let stringResult3 = String(format: "%.2f", result3)
            
            return stringResult3
        } else {
            return ""
        }
    }
    
    func convertToGallons(liters: String) -> String {
        if let floatLiters = Float(liters) {
            let result4 = floatLiters / 3.78541
            let stringResult4 = String(format: "%.2f", result4)
            
            return stringResult4
        } else {
            return ""
        }
    }
    
    func convertToKm(miles: String) -> String {
        if let floatMiles = Float(miles) {
            let result5 = floatMiles * 1.60934
            let stringResult5 = String(format: "%.2f", result5)
            
            return stringResult5
        } else {
            return ""
        }
    }
    
    func convertToMiles(kilometers: String) -> String {
        if let floatKilometers = Float(kilometers) {
            let result6 = floatKilometers * 0.621371
            let stringResult6 = String(format: "%.2f", result6)
            
            return stringResult6
        } else {
            return ""
        }
    }
    
    func leftHandCurrencyMuliplier(leftValue: String, rightValue: String) -> String {
        if Double(leftValue) != nil {
            let doubleLeftValue = currencyManager.multiplier
            let doubleRightValue = Double(rightValue) ?? 1.0
            let result7 = doubleLeftValue * doubleRightValue
            let stringResult7 = String(format: "%.2f", result7)
            
            return stringResult7
            
        } else {
            return ""
        }
    }
    
    func checkTextLength(maxTextLength: Int, input: String) -> String {
        
        if input.count > maxTextLength {
            return String(input.prefix(maxTextLength))
        }
        return input
    }
    
    
}
