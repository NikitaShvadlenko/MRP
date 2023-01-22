import Foundation

// MARK: - SFSymbolRepresentable

protocol SFSymbolRepresentable {
    var systemName: String { get }
}

extension SFSymbolRepresentable where Self: RawRepresentable, RawValue == String {
    var systemName: String { rawValue }
}

// MARK: - SFSymbol

enum SFSymbol: String, SFSymbolRepresentable {
    case chevronRight = "chevron.right"
}
