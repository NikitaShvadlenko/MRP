import UIKit
// sourcery: AutoMockable
protocol SideMenuViewInput: AnyObject {
    func configureViews()
}

protocol SideMenuViewOutput {
    func viewDidLoad(_ view: SideMenuViewInput)
    func tableManagerNeedsSideMenuItem(for navigationSectionItem: NavigationSection) -> NavigationItem
    func tableManagerNeedsCurrencyItem(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem?
}

// sourcery: AutoMockable
protocol SideMenuInteractorInput {
    func fetchNavigationSectionItem(for navigationSection: NavigationSection) -> NavigationItem
    func retrieveUserData(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem?
}

// sourcery: AutoMockable
protocol SideMenuInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol SideMenuRouterInput {
    func routeTo(_ viewController: UIViewController)
}

protocol SideMenuRouterOutput: AnyObject {
}

public protocol SideMenuModuleInput: AnyObject {
	func configureModule(output: SideMenuModuleOutput?)
}

// sourcery: AutoMockable
public protocol SideMenuModuleOutput: AnyObject {
}
