import Foundation
import Networking
import SharedModels

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

    func interactor(_ interactor: LoginScreenInteractorInput, didReceiveUserData data: UserData, key: String) {
        router?.routeToMainScreen()
        view?.removeActivityIndicator()
    }

    func interactor(_ interactor: LoginScreenInteractorInput, didReceiveError error: String) {
        view?.displayNegativeToast(error: error)
        view?.removeActivityIndicator()
    }

    func interactorSentRequest(_ interactor: LoginScreenInteractorInput) {
        view?.showActivityIndicator()
    }

    func interactorRequestComplete(_ interactor: LoginScreenInteractorInput) {
        view?.removeActivityIndicator()
    }

    func intercatorReceivedEmptyTokenField(_ interactor: LoginScreenInteractorInput) {
        view?.displayEmptyFieldToast()
        view?.removeActivityIndicator()
    }
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
    func login() {
        if let password = interactor?.retrievePassword() {
            interactor?.login(with: password)
        }
    }
}
