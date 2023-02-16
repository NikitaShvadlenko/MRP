import UIKit
import SnapKit

public protocol Localizable {
    func localizationDidChange()
}

public extension UIViewController {
    func displayToastMessage(view: UIView) {
        let toastMessage = view
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first(where: { $0.isKeyWindow }) {
            window.addSubview(toastMessage)
        } else {
            self.view.addSubview(toastMessage)
        }

        let screenSize = UIScreen.main.bounds.size
        let height = screenSize.height * 0.1
        toastMessage.snp.updateConstraints { make in
            make.height.equalTo(height)
            make.trailing.leading.equalToSuperview().inset(8)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).multipliedBy(0.7)
        }

        toastMessage.transform = CGAffineTransform(translationX: 0, y: -height)

        self.view.layoutIfNeeded()
        UIView.animate(
            withDuration: 0.75,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0,
            options: .curveEaseInOut
        ) {
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
