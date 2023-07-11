import Foundation
import Networking
import SharedModels
import Keychain
import GameData

final class LoginScreenInteractor {
    weak var presenter: LoginScreenInteractorOutput?
    var networkManager: NetworkManagerProtocol?
    var passwordManager: PasswordManagerProtocol?
    var gameDataManager: GameDataManagerProtocol?
}

// MARK: - LoginScreenInteractorInput
extension LoginScreenInteractor: LoginScreenInteractorInput {
    func saveUserData(_ data: UserData) {
        self.gameDataManager?.setUserData(data)
    }

    func login(with apiKey: String?) {
        self.presenter?.interactorSentRequest(self)
        guard let apiKey = apiKey else {
            fatalError("api key can't be nil")
        }

        guard !apiKey.isEmpty else {
            presenter?.intercatorDidReceiveEmptyTokenField(self)
            return
        }

        guard apiKey != "1111" else {
            self.presenter?.interactorDidReceiveMockPassword(self)
            return
        }

        networkManager?.login(apiKey: apiKey) { [weak self] data, error  in
            guard let self = self else { return }
            if let error = error {
                self.presenter?.interactor(self, didReceiveError: error.localizedDescription)
            } else {
                if let data = data {
                    if self.retrievePassword() == nil {
                        self.savePassword(apiKey)
                    }
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
