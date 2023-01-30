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
            switch response.result {
            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                guard let data = response.data else {
                    completion(nil, error)
                    return
                }
                do {
                    let decodedError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                    let customError = NSError(
                        domain: decodedError.errors[0].messages[0],
                        code: error._code
                    )
                    completion(nil, customError)
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
}
