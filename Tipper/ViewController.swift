//
//  ViewController.swift
//  Tipper
//
//  Created by Alberto on 12/18/17.
//  Copyright © 2017 Alberto Nencioni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let defaults:UserDefaults = UserDefaults.standard
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: CustomSegmentedControl!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    var billFieldValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.addTarget(self, action: #selector(billFieldDidChange), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        let defaultTipIndex = defaults.integer(forKey: "defaultTipIndex")
        tipControl.selectedSegmentIndex = defaultTipIndex
        calculateTip(self)
        //TODO
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func billFieldDidChange(_ textField: UITextField) {
        if let amountString = textField.text?.currencyInputFormatting() {
            textField.text = amountString.text
            billFieldValue = Double(amountString.value)
        }
        
        calculateTip(self)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.20]
        
        let bill = billFieldValue
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.locale = NSLocale.current
        formatter .maximumFractionDigits = 2
        formatter .minimumFractionDigits = 2
        totalLabel.text = formatter.string(from: NSNumber(value: total))
    }
    
}

extension String {
    // Formatting text for currency textField
    func currencyInputFormatting() -> (text: String, value: Double) {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.locale = NSLocale.current
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // Remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // If first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ("", Double(truncating: number))
        }
        
        return (formatter.string(from: number)!, Double(truncating: number))
    }
}

