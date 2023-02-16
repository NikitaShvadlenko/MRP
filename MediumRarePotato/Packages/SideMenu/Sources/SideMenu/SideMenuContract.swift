import SharedModels
import UIKit
// sourcery: AutoMockable
protocol SideMenuViewInput: AnyObject {
    func configureViews()
}

protocol SideMenuViewOutput {
    func viewDidLoad(_ view: SideMenuViewInput)
    func tableManagerNeedsSideMenuItem(for navigationSectionItem: NavigationSection) -> NavigationItem
    func tableManagerNeedsCurrencyItem(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem?
    func viewNeedsListOfSupportedLanguages() -> [Language]?
    func viewDidPressLanguageSelectionButton(title: String)
    func viewDidSelectNavigationRow(navigationItem: NavigationSection)
}

// sourcery: AutoMockable
protocol SideMenuInteractorInput {
    func fetchNavigationSectionItem(for navigationSection: NavigationSection) -> NavigationItem
    func retrieveUserData(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem?
    func changeDefaultLocalization(_ languageKey: String)
    func retrieveSupportedLanguages() -> [Language]?
}

// sourcery: AutoMockable
protocol SideMenuInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol SideMenuRouterInput {
   func routeTo(_ navigationItem: NavigationSection)
}

protocol SideMenuRouterOutput: AnyObject {
}

public protocol SideMenuModuleInput: AnyObject {
	func configureModule(output: SideMenuModuleOutput?)
}

// sourcery: AutoMockable
public protocol SideMenuModuleOutput: AnyObject {
}
