//
//  CustomSegmentedControl.swift
//  Tipper
//
//  Created by Alberto on 12/20/17.
//  Copyright © 2017 Alberto Nencioni. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
  
  var buttons = [UIButton]()
  var selector: UIView!
  var prevSelected = 0
  
  @IBInspectable
  var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable
  var borderColor: UIColor = UIColor.clear {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }
  
  @IBInspectable
  var commaSeparatedButtonTitles: String = "" {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable
  var textColor: UIColor = .lightGray {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable
  var textSize: CGFloat = 17.0 {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable
  var selectorColor: UIColor = .darkGray {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable
  var selectorTextColor: UIColor = .white {
    didSet {
      updateView()
    }
  }
  
  @IBInspectable
  var selectedSegmentIndex: Int = 0 {
    didSet {
      updateView()
    }
  }
  
  func updateView() {
    buttons.removeAll()
    subviews.forEach { $0.removeFromSuperview() }
    
    let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
    
    for buttonTitle in buttonTitles {
      let button = UIButton(type: .system)
      button.setTitle(buttonTitle, for: .normal)
      button.titleLabel?.font = UIFont .systemFont(ofSize: textSize)
      button.setTitleColor(textColor, for: .normal)
      
      button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
      buttons.append(button)
    }
    
    let selectorWidth = frame.width / CGFloat(buttonTitles.count)
    selector = UIView(frame: CGRect(x: CGFloat(prevSelected) * selectorWidth, y: 0, width: selectorWidth, height: frame.height))
    selector.layer.cornerRadius = frame.height / 2
    selector.backgroundColor = selectorColor
    addSubview(selector)
    UIView.animate(withDuration: 0.3, animations: { self.selector.frame.origin.x = CGFloat(self.selectedSegmentIndex) * selectorWidth })
    
    buttons[selectedSegmentIndex].setTitleColor(selectorTextColor, for: .normal)
    prevSelected = selectedSegmentIndex
    
    let sv = UIStackView(arrangedSubviews: buttons)
    sv.axis = .horizontal
    sv.alignment = .fill
    sv.distribution = .fillProportionally
    addSubview(sv)
    sv.translatesAutoresizingMaskIntoConstraints = false
    sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
  }
  
  
  @objc func buttonTapped(button: UIButton) {
    for (btnIndex, btn) in buttons.enumerated() {
      btn.setTitleColor(textColor, for: .normal)
      if btn == button {
        selectedSegmentIndex = btnIndex
      }
    }
    sendActions(for: .valueChanged)
  }
  
  override func draw(_ rect: CGRect) {
    layer.cornerRadius = frame.height / 2
  }
  
}

