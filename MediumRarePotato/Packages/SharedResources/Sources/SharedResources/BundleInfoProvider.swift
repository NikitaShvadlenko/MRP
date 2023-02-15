import Foundation

public protocol ProvidesBundleInfo {
    func fetchBundleInfo(completion: (BundleInfo) -> Void)
    func fetchCurrentBundle() -> Bundle
}

public final class BundleInfoProvider {

    private typealias Resource = (name: String, type: String)

    private enum Configuration {
        static let resource = Resource(name: "Info", type: "plist")
    }

    // MARK: - Init

    public init() { }

}

// MARK: - ProvidesBundleInfo

extension BundleInfoProvider: ProvidesBundleInfo {

    public func fetchBundleInfo(completion: (BundleInfo) -> Void) {
        guard
            let path = Bundle.main.path(
                forResource: Configuration.resource.name,
                ofType: Configuration.resource.type
            ),
            let plist = FileManager.default.contents(atPath: path),
            let bundleInfo = try? PropertyListDecoder().decode(BundleInfo.self, from: plist) else {
            fatalError("\(self) : Can't get bundle info!")
        }
        completion(bundleInfo)
    }

    public func fetchCurrentBundle() -> Bundle {
        Bundle.module
    }
}
