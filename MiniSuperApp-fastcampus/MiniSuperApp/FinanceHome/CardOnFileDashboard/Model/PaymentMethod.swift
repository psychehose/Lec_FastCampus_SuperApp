//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by 호세김 on 2022/02/24.
//

import Foundation

struct PaymentMethod: Decodable {
  let id: String
  let name: String
  let digits: String
  let color: String
  let isPrimary: Bool
}


