import Foundation
import Networking

final class LoginScreenInteractor {
    weak var presenter: LoginScreenInteractorOutput?
    var networkManager: NetworkManagerProtocol?
}

// MARK: - LoginScreenInteractorInput
extension LoginScreenInteractor: LoginScreenInteractorInput {
    func login(with apiKey: String?) {
        // TODO: handle the empty field in a meaningful way
        guard let apiKey = apiKey else {
            print("Token field is empty")
            return
        }

        networkManager?.login(apiKey: apiKey)
    }
}

// MARK: - Private methods
extension LoginScreenInteractor {
}
