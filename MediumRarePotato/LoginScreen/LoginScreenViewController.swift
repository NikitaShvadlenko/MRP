import UIKit
import UIComponents
import SharedExtensions

final class LoginScreenViewController: UIViewController {

    private let loginScreenView = LoginScreenView()

    var presenter: LoginScreenViewOutput?

    override func loadView() {
        view = loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setLoginScreenButtonDelegate(self)
        setTextFieldDelegate(self)
        registerTapGesture()
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
    private func registerTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}

// MARK: ButtonActionDelegate
extension LoginScreenViewController: ButtonActionDelegate {
    func buttonPressed() {
        let token = loginScreenView.token
        presenter?.viewDidTapLoginButton(self, token: token)
        displayToastMessage(style: .positive, message: "Toast Message Appeared", timerDuration: 10)
    }
}

// MARK: UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonPressed()
        return true
    }
}
