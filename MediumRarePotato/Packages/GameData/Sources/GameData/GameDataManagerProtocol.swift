import Foundation
import SharedModels

public protocol GameDataManagerProtocol {
    func setUserData(_ userData: UserData)
    func retrieveUserData() -> UserData?
}

public class GameDataManager {
    private(set) var userData: UserData?

    public init() {
    }
}

// MARK: GameDataStoreProtocol
extension GameDataManager: GameDataManagerProtocol {
    public func retrieveUserData() -> UserData? {
        self.userData
    }

    public func setUserData(_ userData: UserData) {
        self.userData = userData
    }
}
