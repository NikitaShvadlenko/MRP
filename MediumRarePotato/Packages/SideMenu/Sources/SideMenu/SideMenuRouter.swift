import UIKit
import SnapKit
import MyRestaurants
import SharedExtensions

final class SideMenuRouter {
    weak var viewController: UIViewController?
    weak var presenter: SideMenuRouterOutput?
    var containerViewController: UIViewController?
    lazy var parent = viewController?.parent
}

// MARK: - SideMenuRouterInput
extension SideMenuRouter: SideMenuRouterInput {
    func routeTo(_ navigationItem: NavigationSection) {

        guard let containerViewController = containerViewController else {
            fatalError("no parent")
        }

        let viewController = selectViewController(navigationItem)

        for viewController in containerViewController.children {
            if viewController is SideMenuViewController {
                continue
            }
            viewController.view.removeFromSuperview()
            viewController.removeFromParent()
        }

        containerViewController.add(viewController)
        viewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewController.view.layoutSubviews()

        if parent is SideMenuManager {
            if let sideMenuManager = parent as? SideMenuManager {
               sideMenuManager.toggleMenuDisplay()
            }
        }
    }
}

// MARK: - Private methods
extension SideMenuRouter {
    func selectViewController(_ navigationItem: NavigationSection) -> UIViewController {
        switch navigationItem {
        default:
            return MyRestaurantsAssembly.assemble().viewController
        }
    }
}
