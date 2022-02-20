//
//  Formatter.swift
//  MiniSuperApp
//
//  Created by 김호세 on 2022/02/20.
//

import Foundation

struct Formatter {
  static let balanceFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter
  }()
}
