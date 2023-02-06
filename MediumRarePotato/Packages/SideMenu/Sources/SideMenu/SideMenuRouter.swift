import UIKit
import SnapKit

final class SideMenuRouter {
    weak var viewController: UIViewController?
    weak var presenter: SideMenuRouterOutput?
    var containerViewController: UIViewController?
}

// MARK: - SideMenuRouterInput
extension SideMenuRouter: SideMenuRouterInput {
    func routeTo() {
        let testVc = UIViewController()
        testVc.view.backgroundColor = .red
        
    }
}

// MARK: - Private methods
extension SideMenuRouter {
}
