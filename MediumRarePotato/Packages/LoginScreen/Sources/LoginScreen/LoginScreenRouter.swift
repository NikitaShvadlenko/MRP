import UIKit
import MainScreen

final class LoginScreenRouter {
    weak var viewController: UIViewController?
    weak var presenter: LoginScreenRouterOutput?
}

// MARK: - LoginScreenRouterInput
extension LoginScreenRouter: LoginScreenRouterInput {
    func routeToMainScreen() {
        let mainScreenModule = MainScreenAssembly.assemble()
        viewController?.navigationController?.pushViewController(
            mainScreenModule.viewController,
            animated: true
        )
    }
}

// MARK: - Private methods
extension LoginScreenRouter {
}
