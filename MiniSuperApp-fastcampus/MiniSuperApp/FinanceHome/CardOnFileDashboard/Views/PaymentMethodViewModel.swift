//
//  PaymentMethodViewModel.swift
//  MiniSuperApp
//
//  Created by 호세김 on 2022/02/24.
//

import UIKit

struct PaymentMethodViewModel {
  let name: String
  let digits: String
  let color: UIColor
  
  init(_ paymentMethod: PaymentMethod) {
    name = paymentMethod.name
    digits = "**** \(paymentMethod.digits)"
    color = UIColor(hex: paymentMethod.color) ?? .systemGray
  }
}
