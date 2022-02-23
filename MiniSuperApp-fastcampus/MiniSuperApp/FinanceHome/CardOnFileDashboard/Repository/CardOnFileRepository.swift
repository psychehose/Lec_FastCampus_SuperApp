//
//  CardOnFileRepository.swift
//  MiniSuperApp
//
//  Created by 호세김 on 2022/02/24.
//

// 레포지토리
// 받아오는 걸 담당하는 객체
//

import Foundation

protocol CardOnFileRepository {
  var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { get }
}
final class CardOnFileRepositoryImp: CardOnFileRepository {
  // 외부에 노출됨
  var cardOnFile: ReadOnlyCurrentValuePublisher<[PaymentMethod]> { paymentMethodsSubject }
  
  private let paymentMethodsSubject = CurrentValuePublisher<[PaymentMethod]>([
    PaymentMethod(id: "0", name: "우리은행", digits: "0123", color: "#f19a38ff", isPrimary: true),
    PaymentMethod(id: "1", name: "신한카드", digits: "0987", color: "#3478f6ff", isPrimary: true),
    PaymentMethod(id: "2", name: "현대카드", digits: "8121", color: "#78c5f5ff", isPrimary: true),
    PaymentMethod(id: "3", name: "국민은행", digits: "2812", color: "#65c466ff", isPrimary: true),
    PaymentMethod(id: "4", name: "카카오뱅크", digits: "8751", color: "#ffcc00ff", isPrimary: true)
  ])
}
// 인터렉터에서 이걸 읽어서 값을 뿌려주면 됨
