import UIKit
import UIComponents

public extension UIViewController {
    func displayToastMessage(style: ToastMessage.Style, message: String, timerDuration: Float) {
        let toastMessage = ToastMessage(style: style, message: message, timerDuration: timerDuration)
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

    func createSideMenu(
        menuViewController: UIViewController,
        containerViewController: UIViewController,
        padding: CGFloat
    ) {
        add(menuViewController)
        add(containerViewController)

        add(menuViewController)
        menuViewController.view.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(self.view.snp.width).multipliedBy(padding)
        }

        add(containerViewController)
        containerViewController.view.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
        }
    }
}
