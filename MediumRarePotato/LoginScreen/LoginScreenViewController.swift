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
}

// MARK: - LoginScreenViewInput
extension LoginScreenViewController: LoginScreenViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension LoginScreenViewController {
}
