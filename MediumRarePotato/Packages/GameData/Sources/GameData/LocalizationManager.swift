import Foundation
import UIKit
import SharedResources
import SharedModels
// Business logic must not depend on SharedResources package
struct UserDefaultsKeys {
    static let selectedLanguage = "SelectedLanguage"
    static let locale = "Locale"
}

public extension Notification.Name {
    public static let LocalizationDidChange = Notification.Name("LocalizationDidChange")
}

public protocol LocalizationManagerProtocol {
    func supportedLanguages() -> [Language]
    func changeLocalization(to systemName: String)
}

public class LocalizationManager {
    let languages: [Language] = [
        Language(
            displayName: L10n.Localization.eng(),
            name: "English",
            systemName: "en"
        ),

        Language(
            displayName: L10n.Localization.ru(),
            name: "Russian",
            systemName: "ru"
        )

    ]

    public init() {}
}

// MARK: LocalizationManagerProtocol
extension LocalizationManager: LocalizationManagerProtocol {
    public func supportedLanguages() -> [Language] {
        languages
    }

    public func changeLocalization(to systemName: String) {
        let defaults = UserDefaults.standard
        defaults.set([systemName], forKey: "AppleLanguages")
        defaults.synchronize()
        Bundle.setLanguage(systemName)
        NotificationCenter.default.post(name: Notification.Name.LocalizationDidChange, object: nil)
    }

}

extension Bundle {
    static func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: "AppLanguage")
        UserDefaults.standard.synchronize()
        let bondle = FontRegister().rbundle()
        guard let path = bondle.path(forResource: language, ofType: "lproj") else {
            return
        }

        let bundle = Bundle(path: path)

        objc_setAssociatedObject(
            Bundle.main,
            &Bundle.kLanguageBundleKey,
            bondle,
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }

    private static var kLanguageBundleKey: UInt8 = 0

    var languageBundle: Bundle? {
        get {
            return objc_getAssociatedObject(self, &Bundle.kLanguageBundleKey) as? Bundle
        }

        set {
            objc_setAssociatedObject(
                self,
                &Bundle.kLanguageBundleKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }

    func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = self.languageBundle {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return NSLocalizedString(key, tableName: tableName, value: value ?? "", comment: "")
        }
    }
}
