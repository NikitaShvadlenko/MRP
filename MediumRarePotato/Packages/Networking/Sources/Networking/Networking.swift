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
    private func errorFromResponseBody<T>(
        response: DataResponse<T, AFError>,
        error: AFError,
        completion: @escaping (UserData?, Error?) -> Void
    ) {
        guard let data = response.data, let responseCode = error.responseCode else {
            completion(nil, error)
            return
        }

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
        .responseDecodable(of: UserData.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)

            case .failure(let error):
                self.errorFromResponseBody(response: response, error: error, completion: completion)
            }
        }
    }
}
