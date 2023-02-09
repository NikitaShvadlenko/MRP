import UIKit
import SnapKit

final class SideMenuRouter {
    weak var viewController: UIViewController?
    weak var presenter: SideMenuRouterOutput?
    var containerViewController: UIViewController?
}

// MARK: - SideMenuRouterInput
extension SideMenuRouter: SideMenuRouterInput {
    func routeTo(_ viewController: UIViewController) {
        guard let parent = containerViewController?.parent else {
            fatalError("no parent")
        }
        containerViewController?.removeFromParent()
        viewController.view.backgroundColor = .red
        parent.view.addSubview(viewController.view)
        viewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        viewController.view.layoutSubviews()
    }
}

// MARK: - Private methods
extension SideMenuRouter {
}
