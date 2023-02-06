import UIKit
import SnapKit

public extension UIViewController {
    func displayToastMessage(view: UIView) {
        let toastMessage = view
        self.view.addSubview(toastMessage)
        toastMessage.snp.updateConstraints { make in
            make.height.equalTo(100)
            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }

        toastMessage.transform = CGAffineTransform(translationX: 0, y: -100)
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.35) {
            toastMessage.transform = .identity
        }
    }

    func displaySideMenu(
        sideMenuViewController: UIViewController,
        padding: CGFloat,
        isMenuDisplayed: inout Bool,
        animationDuration: Double
    ) {
        let sideMenu = sideMenuViewController
        isMenuDisplayed.toggle()

        if isMenuDisplayed {
            self.add(sideMenu)
            sideMenu.view.snp.makeConstraints { make in
                make.height.equalToSuperview()
                make.trailing.equalToSuperview()
                make.width.equalTo(view.snp.width).multipliedBy(padding)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
            self.view.layoutIfNeeded()
            sideMenu.view.transform = CGAffineTransform(translationX: sideMenu.view.frame.width + 100, y: 0)
            UIView.animate(withDuration: animationDuration) {
                sideMenu.view.transform = .identity
            }
        } else {
            // swiftlint:disable multiline_arguments
            UIView.animate(withDuration: animationDuration) {
                sideMenu.view.transform = CGAffineTransform(translationX: sideMenu.view.frame.width + 100, y: 0)
            } completion: { _ in
                sideMenu.remove()
            }
        }
    }

    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
