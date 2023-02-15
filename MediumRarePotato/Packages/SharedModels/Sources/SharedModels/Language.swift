import Foundation

public struct Language {
    public let displayName: String
    public let name: String
    public let systemName: String

    public init(displayName: String, name: String, systemName: String) {
        self.displayName = displayName
        self.name = name
        self.systemName = systemName
    }
}
