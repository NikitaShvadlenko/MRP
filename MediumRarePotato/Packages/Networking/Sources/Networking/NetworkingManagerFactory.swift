import Foundation

public final class NetworkingManagerFactory {

    public static let shared = NetworkingManagerFactory()

    // Restrict initialization outside this class
    private init() { }

    public private(set) lazy var networkManager: NetworkManagerProtocol = NetworkManager()
}
