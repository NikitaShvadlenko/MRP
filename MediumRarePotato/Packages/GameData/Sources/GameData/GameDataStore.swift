import Foundation
import SharedModels

public protocol GameDataStoreProtocol {
    func setUserData(_ userData: UserData)
}

public class GameDataStore {
    private(set) var userData: UserData?

    public init() {
    }
}

// MARK: GameDataStoreProtocol
extension GameDataStore: GameDataStoreProtocol {
    public func setUserData(_ userData: UserData) {
        self.userData = userData
    }
}

