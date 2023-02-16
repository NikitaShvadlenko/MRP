import UIKit
import SnapKit
import MyRestaurants
import SharedExtensions

final class SideMenuRouter {
    weak var viewController: UIViewController?
    weak var presenter: SideMenuRouterOutput?
    var containerViewController: UIViewController?
    lazy var parent = containerViewController?.parent
}

// MARK: - SideMenuRouterInput
extension SideMenuRouter: SideMenuRouterInput {
    func routeTo(_ navigationItem: NavigationSection) {
        guard let parent = parent else {
            fatalError("no parent")
        }
        var viewController: UIViewController?

        switch navigationItem {
        default:
             viewController = MyRestaurantsAssembly.assemble().viewController
        }

        guard let viewController = viewController else { return }

        viewController.view.backgroundColor = .red
        for viewController in parent.children {
            viewController.removeFromParent()
        }

        parent.add(viewController)
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
}
