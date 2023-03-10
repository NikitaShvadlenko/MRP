import UIKit
import UIComponents
import SharedExtensions
import SharedResources

final class LoginScreenViewController: UIViewController {

    let activityViewController = ActivityViewController()
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

    func setLoginScreenButtonDelegate(_ delegate: CustomButtonActionDelegate) {
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
        let toastMessage = ToastMessage(
            style: .negative,
            message: L10n.Error.emptyTokenField(),
            timerDuration: 10
        )
        displayToastMessage(view: toastMessage)
    }

    func displayNegativeToast(error: String) {
        let toastMessage = ToastMessage(
            style: .negative,
            message: error,
            timerDuration: 10
        )
        displayToastMessage(view: toastMessage)
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

    private func loginWithToken() {
        let token = loginScreenView.token
        presenter?.viewDidTapLoginButton(self, token: token)
    }
}

// MARK: ButtonActionDelegate
extension LoginScreenViewController: CustomButtonActionDelegate {
    func buttonPressed(_ button: CustomButton) {
        loginWithToken()
    }
}

// MARK: UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        loginWithToken()
        return true
    }
}

// MARK: Localizable
extension LoginScreenViewController: Localizable {
    func localizationDidChange() {
        loginScreenView.regenerateView()
    }
}
