import Foundation
import SharedModels
import Alamofire

public protocol NetworkManagerProtocol {
    func login(apiKey: String, completion: @escaping (UserData?, Error?) -> Void)
}

public final class NetworkManager {
    public init() {

    }
}

// MARK: Private Methods
extension NetworkManager {
}

// MARK: Network Manager Protocol
extension NetworkManager: NetworkManagerProtocol {
    public func login(apiKey: String, completion: @escaping (UserData?, Error?) -> Void) {
        let parameters: HTTPHeaders = [
            "api-key": apiKey
        ]
        AF.request("https://game.medium-rare-potato.io/v1/user/",
                   method: .get,
                   headers: parameters
        )
        .responseDecodable(of: UserData.self) { response in
            if let error = response.error {
                completion(nil, error)
            }
            if let data = response.value {
                print(data)
            }
        }
    }
}
