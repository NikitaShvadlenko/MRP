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
