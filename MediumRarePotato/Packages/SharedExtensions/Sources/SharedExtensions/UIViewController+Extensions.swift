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
}
