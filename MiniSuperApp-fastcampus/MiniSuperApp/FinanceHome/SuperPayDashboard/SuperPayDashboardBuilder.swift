//
//  SuperPayDashboardBuilder.swift
//  MiniSuperApp
//
//  Created by 호세김 on 2022/02/17.
//

import Foundation

import ModernRIBs
  // 부모로부터 받고 싶은 Dependency를 여기에 선언.
protocol SuperPayDashboardDependency: Dependency {
  var balance: ReadOnlyCurrentValuePublisher<Double> { get }
}

final class SuperPayDashboardComponent: Component<SuperPayDashboardDependency>, SuperPayDashboardInteractorDependency {
  var balanceFormatter: NumberFormatter { Formatter.balanceFormatter }
  
  // 이 디펜던시는 어디에서 와야할까 부모 or 생성
  var balance: ReadOnlyCurrentValuePublisher<Double> { dependency.balance }
}

// MARK: - Builder

protocol SuperPayDashboardBuildable: Buildable {
  func build(withListener listener: SuperPayDashboardListener) -> SuperPayDashboardRouting
}

final class SuperPayDashboardBuilder: Builder<SuperPayDashboardDependency>, SuperPayDashboardBuildable {
  
  override init(dependency: SuperPayDashboardDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: SuperPayDashboardListener) -> SuperPayDashboardRouting {
    let component = SuperPayDashboardComponent(dependency: dependency)
    let viewController = SuperPayDashboardViewController()
    
    let interactor = SuperPayDashboardInteractor(
      dependency: component,
      presenter: viewController
    )
    interactor.listener = listener
    return SuperPayDashboardRouter(interactor: interactor, viewController: viewController)
  }
}
