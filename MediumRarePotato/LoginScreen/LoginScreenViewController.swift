import UIKit
import UIComponents
import SharedExtensions

public final class LoginScreenViewController: UIViewController {

    let activityViewController = ActivityViewController()
    private let loginScreenView = LoginScreenView()

    var presenter: LoginScreenViewOutput?

    override public func loadView() {
        view = loginScreenView
    }

    override public func viewDidLoad() {
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

    func showActivityIndicator() {
        add(activityViewController)
    }

    func removeActivityIndicator() {
        activityViewController.remove()
    }

    func displayEmptyFieldToast() {
        displayToastMessage(style: .negative, message: "The token field can not be empty!", timerDuration: 10)
    }

    func displayNegativeToast(error: String) {
        displayToastMessage(style: .negative, message: error, timerDuration: 10)
    }

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
    public func buttonPressed() {
        let token = loginScreenView.token
        presenter?.viewDidTapLoginButton(self, token: token)
    }
}

// MARK: UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonPressed()
        return true
    }
}
