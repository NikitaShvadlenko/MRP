import Foundation
import Networking
import SharedModels
import Keychain

final class LoginScreenInteractor {
    weak var presenter: LoginScreenInteractorOutput?
    var networkManager: NetworkManagerProtocol?
    var passwordManager: PasswordManagerProtocol?
}

// MARK: - LoginScreenInteractorInput
extension LoginScreenInteractor: LoginScreenInteractorInput {
    func login(with apiKey: String?) {
        self.presenter?.interactorSentRequest(self)
        guard let apiKey = apiKey else {
            fatalError("api key can't be nil")
        }

        guard !apiKey.isEmpty else {
            presenter?.intercatorReceivedEmptyTokenField(self)
            return
        }

        networkManager?.login(apiKey: apiKey) { [weak self] data, error  in
            guard let self = self else { return }
            if let error = error {
                self.presenter?.interactor(self, didReceiveError: error.localizedDescription)
            } else {
                if let data = data {
                    self.savePassword(apiKey)
                    self.presenter?.interactor(self, didReceiveUserData: data, key: apiKey)
                }
            }
        }
    }

    func retrievePassword() -> String? {
        guard let data = passwordManager?.retrievePassword() else {
            return nil
        }
        return String(decoding: data, as: UTF8.self)
    }
}

// MARK: - Private methods
extension LoginScreenInteractor {
    private func savePassword(_ password: String) {
        do {
            let password = password.data(using: .utf8) ?? Data()
            try passwordManager?.savePassword(password)
        } catch {
            print(error)
        }
    }
}
