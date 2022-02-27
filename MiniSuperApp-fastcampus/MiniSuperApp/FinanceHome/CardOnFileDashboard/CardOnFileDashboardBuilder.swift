//
//  CardOnFileDashboardBuilder.swift
//  MiniSuperApp
//
//  Created by 호세김 on 2022/02/22.
//

import ModernRIBs

protocol CardOnFileDashboardDependency: Dependency {
  var cardOnfFileRepository: CardOnFileRepository { get }
}

final class CardOnFileDashboardComponent: Component<CardOnFileDashboardDependency>, CardOnFileDashboardInteractorDependency {

  var cardsOnFileRepository: CardOnFileRepository { dependency.cardOnfFileRepository }
}

// MARK: - Builder

protocol CardOnFileDashboardBuildable: Buildable {
    func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting
}

final class CardOnFileDashboardBuilder: Builder<CardOnFileDashboardDependency>, CardOnFileDashboardBuildable {

    override init(dependency: CardOnFileDashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CardOnFileDashboardListener) -> CardOnFileDashboardRouting {
        let component = CardOnFileDashboardComponent(dependency: dependency)
        let viewController = CardOnFileDashboardViewController()
      let interactor = CardOnFileDashboardInteractor(
        presenter: viewController,
        dependency: component
      )
        interactor.listener = listener
        return CardOnFileDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
