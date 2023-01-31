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
        .responseDecodable(of: UserData.self) { [weak self] response in
            switch response.result {
            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                guard let data = response.data else {
                    fatalError(error.localizedDescription)
                }
                guard let responseCode = response.response?.statusCode else {
                    fatalError(error.localizedDescription)
                }
                self?.decodeCustomError(data: data, responseCode: responseCode, completion: completion)
            }
        }
    }
}

// MARK: Private Methods
extension NetworkManager {

    private func decodeCustomError (data: Data, responseCode: Int, completion: @escaping (UserData?, Error?) -> Void) {
        switch responseCode {
        case 400:
            do {
                let decodedError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                let customError = NSError(
                    domain: decodedError.errors[0].messages[0],
                    code: responseCode
                )
                completion(nil, customError)
            } catch {
                completion(nil, error)
            }

        default:
            do {
                let decodedError = try JSONDecoder().decode(SimpleError.self, from: data)
                let customError = NSError(
                    domain: decodedError.detail,
                    code: responseCode
                )
                completion(nil, customError)
            } catch {
                completion(nil, error)
            }
        }
    }
}
