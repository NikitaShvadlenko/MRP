import Foundation

public struct BundleInfo {
    let displayName: String
    let identifier: String
    let name: String
    let version: String
    let appFonts: [String]?
}

// MARK: - Codable

extension BundleInfo: Codable {
    private enum CodingKeys: String, CodingKey {
        case displayName = "CFBundleDisplayName"
        case identifier = "CFBundleIdentifier"
        case version = "CFBundleVersion"
        case name = "CFBundleName"
        case appFonts = "UIAppFonts"
    }
}
