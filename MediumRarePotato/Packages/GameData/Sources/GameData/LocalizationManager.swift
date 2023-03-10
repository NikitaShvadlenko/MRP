import Foundation
import SharedResources
import SharedModels
// Business logic must not depend on SharedResources package
public extension Notification.Name {
    static let LocalizationDidChange = Notification.Name("LocalizationDidChange")
}

public protocol LocalizationManagerProtocol {
    func supportedLanguages() -> [Language]
    func changeLocalization(to displayName: String)
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

    public func changeLocalization(to displayName: String) {
        guard let language = languages.first(where: { $0.displayName == displayName }) else { return }
        let defaults = UserDefaults.standard
        defaults.set([language.systemName], forKey: UserDefaultsKeys.selectedLanguage)
        defaults.synchronize()
        Bundle.setLanguage(language.systemName)
        NotificationCenter.default.post(name: Notification.Name.LocalizationDidChange, object: nil)
    }

}

extension Bundle {
    private static var kLanguageBundleKey: UInt8 = 0

    static func setLanguage(_ language: String) {
        UserDefaults.standard.set(language, forKey: UserDefaultsKeys.selectedLanguage)
        UserDefaults.standard.synchronize()
        let stringBundle = BundleInfoProvider().fetchCurrentBundle()
        guard let path = stringBundle.path(forResource: language, ofType: UserDefaultsKeys.localizationFileType) else {
            return
        }

        let bundle = Bundle(path: path)

        objc_setAssociatedObject(
            Bundle.main,
            &Bundle.kLanguageBundleKey,
            bundle,
            objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC
        )
    }
}
