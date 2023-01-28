import Foundation
import Alamofire

public protocol NetworkManagerProtocol {
    func login(apiKey: String, completion: @escaping (Data?, Error?) -> Void)
}

public final class NetworkManager {
    public init() {

    }
}

// MARK: Private Methods
extension NetworkManager {
    private func execute(parameters: HTTPHeaders, completion: @escaping (Data?, Error?) -> Void) {
        AF.request("https://game.medium-rare-potato.io/v1/user/",
                   method: .get,
                   headers: parameters
        )
        .response { response in
            switch response.result {

            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

// MARK: Network Manager Protocol
extension NetworkManager: NetworkManagerProtocol {
    public func login(apiKey: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters: HTTPHeaders = [
            "api-key": apiKey
        ]
        execute(parameters: parameters, completion: completion)
    }
}
