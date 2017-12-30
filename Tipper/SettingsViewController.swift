//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Alberto on 12/18/17.
//  Copyright © 2017 Alberto Nencioni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  
  let defaults:UserDefaults = UserDefaults.standard
  @IBOutlet weak var tipControl: CustomSegmentedControl!
  @IBOutlet weak var groupSlider: UISlider!
  @IBOutlet weak var groupLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let defaultTipIndex = defaults.integer(forKey: "defaultTipIndex")
    tipControl.selectedSegmentIndex = defaultTipIndex
    let defaultGroupSize = defaults.integer(forKey: "defaultGroupSize")
    if defaultGroupSize != 0 {
      groupSlider.value = Float(defaultGroupSize)
      groupLabel.text = String(defaultGroupSize)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func setDefault(_ sender: Any) {
    defaults.set(tipControl.selectedSegmentIndex, forKey: "defaultTipIndex")
    groupLabel.text = String(Int(groupSlider.value))
    defaults.set(Int(groupSlider.value), forKey: "defaultGroupSize")
    defaults.synchronize()
  }
}
