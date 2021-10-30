//
//  ViewController.swift
//  MileageConverter
//
//  Created by Christian Regul on 5/26/20.
//  Copyright © 2020 Christian Regul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputMpg: UITextField!
    @IBOutlet weak var inputLp100: UITextField!
    @IBOutlet weak var inputGal: UITextField!
    @IBOutlet weak var inputLtr: UITextField!
    @IBOutlet weak var inputMiles: UITextField!
    @IBOutlet weak var inputKilometers: UITextField!
    @IBOutlet weak var currencyPicker1: UIPickerView!
    @IBOutlet weak var currencyPicker2: UIPickerView!
    @IBOutlet weak var currencyLeft: UITextField!
    @IBOutlet weak var currencyRight: UITextField!
    
    var currencyManager = CurrencyManager()
    var converter = Conversion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        currencyPicker1.delegate = self
        currencyPicker2.delegate = self
        currencyManager.delegate = self
        
    }
    
    
    
    
    @IBAction func convertToKm(_ sender: UITextField) {
        inputMiles.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        inputKilometers.text = converter.convertToKm(miles: inputMiles.text ?? "")
    }
    
    @IBAction func convertToMiles(_ sender: UITextField) {
        inputKilometers.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        inputMiles.text = converter.convertToMiles(kilometers: inputKilometers.text ?? "")
    }
    @IBAction func convertToLiters(_ sender: UITextField) {
        inputGal.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        inputLtr.text = converter.convertToLiters(gallons: inputGal.text ?? "")
    }
    
    @IBAction func convertToGallons(_ sender: UITextField) {
        inputLtr.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        inputGal.text = converter.convertToGallons(liters: inputLtr.text ?? "")
    }
    
    @IBAction func convertToLPH(_ sender: UITextField) {
        inputMpg.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        inputLp100.text = converter.convertToLPH(mpg: inputMpg.text ?? "")
    }
    
    @IBAction func convertToMPG(_ sender: UITextField) {
        inputLp100.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        inputMpg.text = converter.convertToMPG(ltsp100: inputLp100.text ?? "")
        
    }
    
    @IBAction func convertToCurrencyRight(_ sender: UITextField) {
        currencyLeft.text = converter.checkTextLength(maxTextLength: 7, input: sender.text ?? "")
        currencyRight.text = converter.leftHandCurrencyMuliplier(leftValue: currencyLeft.text ?? "", rightValue: currencyRight.text ?? "")
    }
    
}

//MARK: - CurrencyManagerDelegate

extension ViewController: CurrencyManagerDelegate {
    func didUpdatePrice(price: String) {
        
        DispatchQueue.main.async {
            self.currencyRight.text = price
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}


//MARK: - UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = currencyManager.currencyArray[row]
        currencyManager.baseCurrency = selectedCurrency
        currencyManager.getTargetCurrency(for: selectedCurrency)
        print("\(currencyManager.baseURL + currencyManager.apiKey + currencyManager.time + currencyManager.baseCurrency)")
    }

}
