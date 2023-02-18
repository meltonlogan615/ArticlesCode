//
//  DefaultButtonsViewController.swift
//  ButtonFun
//
//  Created by Logan Melton on 2/17/23.
//

import UIKit

class DefaultButtonsViewController: UIViewController {
  
  let closeButton = UIButton(type: .close)
  let closeLabel = UILabel()
  let contactAddButton = UIButton(type: .contactAdd)
  let contactAddLabel = UILabel()
  let detailDisclosureButton = UIButton(type: .detailDisclosure)
  let detailDisclosureLabel = UILabel()
  let infoDarkButton = UIButton(type: .infoDark)
  let infoDarkLabel = UILabel()
  let infoLightButton = UIButton(type: .infoLight)
  let infoLightLabel = UILabel()
  let systemButton = UIButton(type: .system)
  let systemLabel = UILabel()
  var customButton = UIButton(type: .custom)
  let customLabel = UILabel()
  let stack = UIStackView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    style()
  }
  
  func style() {
    customButton = CustomButton(title: "Custom Button")
    let buttonLabels = [closeButton: closeLabel,
                   contactAddButton: contactAddLabel,
             detailDisclosureButton: detailDisclosureLabel,
                     infoDarkButton: infoDarkLabel,
                    infoLightButton: infoLightLabel,
                       systemButton: systemLabel,
                       customButton: customLabel,
    ]
    
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.alignment = .center
    stack.distribution = .equalSpacing
    stack.spacing = 24
    
    for (button, label) in buttonLabels {
      let row = setupButtonRows(button: button, label: label)
      stack.addArrangedSubview(row)
    }
    
    view.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
}

extension DefaultButtonsViewController {
  func setupButtonRows(button: UIButton, label: UILabel) -> UIView {
    button.translatesAutoresizingMaskIntoConstraints = false
    label.translatesAutoresizingMaskIntoConstraints = false
    let type = button.buttonType
    switch type {
      case .custom:
        button.setTitle("Custom Button", for: [])
      case .system:
        button.setTitle("System Button", for: [])
      case .detailDisclosure:
        label.text = "Detail Disclosure Button"
      case .infoLight:
        label.text = "Info Light Button"
      case .infoDark:
        label.text = "Info Dark Button"
      case .contactAdd:
        label.text = "Contact Add Button"
      case .close:
        label.text = "Close Button Button"
      @unknown default:
        break
    }
    label.textAlignment = .natural
    let buttonRow: UIView = {
      let buttonView = UIView()
      buttonView.translatesAutoresizingMaskIntoConstraints = false
      buttonView.addSubview(button)
      NSLayoutConstraint.activate([
        button.topAnchor.constraint(equalTo: buttonView.topAnchor),
        button.leadingAnchor.constraint(equalTo: buttonView.leadingAnchor),
        button.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor)
      ])
      
      buttonView.addSubview(label)
      NSLayoutConstraint.activate([
        label.topAnchor.constraint(equalTo: buttonView.topAnchor),
        label.leadingAnchor.constraint(equalToSystemSpacingAfter: button.trailingAnchor, multiplier: 2),
        label.trailingAnchor.constraint(equalTo: buttonView.trailingAnchor),
        label.bottomAnchor.constraint(equalTo: buttonView.bottomAnchor)
      ])
      return buttonView
    }()
    return buttonRow
  }
}
  
