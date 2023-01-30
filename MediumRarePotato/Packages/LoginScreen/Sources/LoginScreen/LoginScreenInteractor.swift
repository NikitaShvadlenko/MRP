import Foundation
import Networking
import SharedModels

final class LoginScreenInteractor {
    weak var presenter: LoginScreenInteractorOutput?
    var networkManager: NetworkManagerProtocol?
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
                    self.presenter?.interactor(self, didReceiveUserData: data)
                }
            }
        }
    }
}

// MARK: - Private methods
extension LoginScreenInteractor {
}
