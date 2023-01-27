import Foundation
import Networking

final class LoginScreenPresenter {
    weak var view: LoginScreenViewInput?
    weak var moduleOutput: LoginScreenModuleOutput?
    var interactor: LoginScreenInteractorInput?
    var router: LoginScreenRouterInput?
}

// MARK: - LoginScreenViewOutput
extension LoginScreenPresenter: LoginScreenViewOutput {

    func viewDidLoad(_ view: LoginScreenViewInput) {
        view.configureViews()
    }

    func viewDidTapLoginButton(_ view: LoginScreenViewInput, token: String?) {
        interactor?.login(with: token)
    }
}

// MARK: - LoginScreenInteractorOutput
extension LoginScreenPresenter: LoginScreenInteractorOutput {
}

// MARK: - LoginScreenRouterOutput
extension LoginScreenPresenter: LoginScreenRouterOutput {
}

// MARK: - LoginScreenModuleInput
extension LoginScreenPresenter: LoginScreenModuleInput {
    func configureModule(output: LoginScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension LoginScreenPresenter {

}
