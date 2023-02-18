//
//  CustomButton.swift
//  ButtonFun
//
//  Created by Logan Melton on 2/17/23.
//

import UIKit

class CustomButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(title: String) {
    self.init()
    self.setTitle(title, for: [])
    styleButton()
  }
  
  private func styleButton() {
    var config  = UIButton.Configuration.borderedProminent()
    config.baseForegroundColor = .systemBackground
    config.baseBackgroundColor = .systemBlue
    self.configuration = config
  }
}
