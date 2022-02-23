import ModernRIBs

protocol FinanceHomeInteractable: Interactable, SuperPayDashboardListener, CardOnFileDashboardListener {
  var router: FinanceHomeRouting? { get set }
  var listener: FinanceHomeListener? { get set }
}

protocol FinanceHomeViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
  func addDashboard(_ view: ViewControllable)
}

final class FinanceHomeRouter: ViewableRouter<FinanceHomeInteractable, FinanceHomeViewControllable>, FinanceHomeRouting {
  
  private let superPayDashboardBuildable: SuperPayDashboardBuildable
  private var superpayRouting: Routing?
  
  private let cardOnFileDashBoardBuildable: CardOnFileDashboardBuildable
  private var cardOnFileRouting: Routing?

  init(
    interactor: FinanceHomeInteractable,
    viewController: FinanceHomeViewControllable,
    superPayDashboardBuildable: SuperPayDashboardBuildable,
    cardOnFileDashBoardBuildable: CardOnFileDashboardBuildable
  ) {
    self.superPayDashboardBuildable = superPayDashboardBuildable
    self.cardOnFileDashBoardBuildable = cardOnFileDashBoardBuildable
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  func attachSuperPayDashboard() {

    if superpayRouting != nil {
      return
    }

    let router = superPayDashboardBuildable.build(withListener: interactor)

    let dashboard = router.viewControllable
    viewController.addDashboard(dashboard)

    self.superpayRouting = router
    attachChild(router)

  }
  func attachCardOnFileDashboard() {
    if cardOnFileRouting != nil {
      return
    }
    let router = cardOnFileDashBoardBuildable.build(withListener: interactor)

    let dashboard = router.viewControllable
    viewController.addDashboard(dashboard)

    self.cardOnFileRouting = router
    attachChild(router)
  }
}
