import Foundation
import Alamofire

public final class NetworkManager {
    public init() {

    }
}

// MARK: Private Methods
extension NetworkManager {
    private func execute(parameters: HTTPHeaders) {
        AF.request("https://game.medium-rare-potato.io/v1/user/", method: .get, headers: parameters).response { response in
            print(response.data)
        }
    }
}

// MARK: Public Methods
extension NetworkManager {
    public func login(apiKey: String) {
        let parameters: HTTPHeaders = [
            "api-key": apiKey
        ]
        execute(parameters: parameters)
    }
}