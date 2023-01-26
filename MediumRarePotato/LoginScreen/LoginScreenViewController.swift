import UIKit
import UIComponents

final class LoginScreenViewController: UIViewController {

    private let loginScreenView = LoginScreenView()

    var presenter: LoginScreenViewOutput?

    override func loadView() {
        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }

    func setLoginScreenButtonDelegate(_ delegate: ButtonActionDelegate) {
        loginScreenView.buttonDelegate = delegate
    }

    func setTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        loginScreenView.textFieldDelegate = delegate
    }
}

// MARK: - LoginScreenViewInput
extension LoginScreenViewController: LoginScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension LoginScreenViewController {
}

// MARK: ButtonActionDelegate
extension LoginScreenViewController: ButtonActionDelegate {
    func buttonPressed() {
        print("Button Pressed")
    }
}

// MARK: UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {

}
