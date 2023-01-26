import UIKit

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

    func setLoginDelegate(delegate: LoginDelegateProtocol) {
     loginScreenView.loginDelegate = delegate
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
