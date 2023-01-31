import Foundation

public protocol PasswordManagerProtocol {
    func savePassword(_ password: Data) throws
    func retrievePassword() -> Data?
}

public class Keychain {
    let service = "Medium-Rare-Potato"
    let account = "Medium-Rare-Potato Account"

    public init() {
    }
}

extension Keychain: PasswordManagerProtocol {

    public func savePassword(_ password: Data) throws {
            let query: [String: AnyObject] = [
                kSecAttrService as String: service as AnyObject,
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: account as AnyObject,
                kSecValueData as String: password as AnyObject
            ]

            let status = SecItemAdd(query as CFDictionary, nil)

            guard status != errSecDuplicateItem else {
                throw KeychainError.duplicationEntry
            }

            guard status == errSecSuccess else {
                throw KeychainError.unknown(status)
            }
            print("saved \(String(decoding: password, as: UTF8.self))")
        }

    public func retrievePassword() -> Data? {
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            return nil
        }
        return result as? Data
    }

}

extension Keychain {
    enum KeychainError: Error {
        case duplicationEntry
        case unknown(OSStatus)
    }
}
