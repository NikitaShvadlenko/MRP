import UIKit

final class ContainerViewRouter {
    weak var viewController: UIViewController?
    weak var presenter: ContainerViewRouterOutput?
}

// MARK: - ContainerViewRouterInput
extension ContainerViewRouter: ContainerViewRouterInput {
}

// MARK: - Private methods
extension ContainerViewRouter {
}
