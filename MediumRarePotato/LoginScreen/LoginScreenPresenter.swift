import Foundation

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
        login(with: token)
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
    private func login(with token: String?) {
        // TODO: handle the empty field in a meaningful way
        guard let token = token else {
            print("Token field is empty")
            return
        }
        print(token)
    }
}
