import Foundation
import Alamofire

final class NetworkManager {

}

// MARK: Private Methods
extension NetworkManager {
    private func execute(parameters: [String: String]) {
        AF.request("https://game.medium-rare-potato.io/", method: .get, parameters: parameters).response { response in
            print(response)
        }
    }
}

// MARK: Public Methods
extension NetworkManager {
    public func login(apiKey: String) {
        let parameters: [String: String] = [
            "api-key": apiKey
        ]
        execute(parameters: parameters)
    }
}
