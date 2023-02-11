import Foundation

public final class GameDataFactory {

    public static let shared = GameDataFactory()

    // Restrict initialization outside this class
    private init() { }

    public private(set) lazy var gameDataStore: GameDataStoreProtocol = GameDataStore()
}
