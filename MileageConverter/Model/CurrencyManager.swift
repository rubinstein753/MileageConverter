//
//  CurrencyManager.swift
//  MileageConverter
//
//  Created by Christian Regul on 5/16/21.
//  Copyright © 2021 Christian Regul. All rights reserved.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdatePrice(price: String)
    func didFailWithError(error: Error)
}

struct CurrencyManager {
    
    var delegate: CurrencyManagerDelegate?
    
    var baseURL = "https://v6.exchangerate-api.com/v6/"
    let apiKey = "729dc29a8ccff58876a5a4e3"
    let time = "/latest/"
    let currencyArray = ["AUD", "CAD", "CHF", "EUR", "GBP", "NZD", "JPY", "USD"]
    var baseCurrency = "USD"
    var multiplier = 1.0
    func getTargetCurrency(for currency: String) {
        
        let urlString = "\(baseURL + apiKey + time + baseCurrency)"
        print(urlString)
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {
                (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                     if let targetCurrency =
                            self.parseJSON(safeData) {
                        
                        self.delegate?.didUpdatePrice(price: targetCurrency)
                     }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let  decodedData = try decoder.decode(CurrencyData.self, from: data)
            
            let lastPrice = decodedData.conversion_rates.CAD * multiplier
            let stringLastPrice = String(format: "%.2f", lastPrice)
            print(decodedData.conversion_rates.CAD)
            return stringLastPrice
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
