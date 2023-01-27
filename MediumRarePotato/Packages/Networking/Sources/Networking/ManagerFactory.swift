import Foundation

public final class ManagerFactory {

    public static let shared = ManagerFactory()

    // Restrict initialization outside this class
    private init() { }

    public private(set) lazy var networkManager: NetworkManagerProtocol = NetworkManager()
}
