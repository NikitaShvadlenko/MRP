import Foundation

final class SideMenuPresenter {
    weak var view: SideMenuViewInput?
    weak var moduleOutput: SideMenuModuleOutput?
    var interactor: SideMenuInteractorInput?
    var router: SideMenuRouterInput?
}

// MARK: - SideMenuViewOutput
extension SideMenuPresenter: SideMenuViewOutput {
    func tableManagerNeedsSideMenuItem(for navigationSectionItem: NavigationSection) -> NavigationItem {
        guard let item = interactor?.fetchNavigationSectionItem(for: navigationSectionItem) else {
            fatalError("Could not fetch navigation item")
        }
        return item
    }

    func viewDidLoad(_ view: SideMenuViewInput) {
        view.configureViews()
    }
}

// MARK: - SideMenuInteractorOutput
extension SideMenuPresenter: SideMenuInteractorOutput {
}

// MARK: - SideMenuRouterOutput
extension SideMenuPresenter: SideMenuRouterOutput {
}

// MARK: - SideMenuModuleInput
extension SideMenuPresenter: SideMenuModuleInput {
    func configureModule(output: SideMenuModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension SideMenuPresenter {
}
