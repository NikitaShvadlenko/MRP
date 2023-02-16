import UIKit
import SharedExtensions
import SharedModels
import GameData
import SharedResources

final class SideMenuViewController: UIViewController {

    private let sideMenuView = SideMenuView()

    var presenter: SideMenuViewOutput?

    override func loadView() {
        view = sideMenuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleLocalizationChange),
            name: Notification.Name.LocalizationDidChange,
            object: nil
        )
        presenter?.viewDidLoad(self)
    }

    func setTableViewDelegate(_ delegate: UITableViewDelegate) {
        sideMenuView.delegate = delegate
    }

    func setTableViewDataSource(_ dataSource: UITableViewDataSource) {
        sideMenuView.dataSource = dataSource
    }
}
// MARK: - SideMenuDelegate
extension SideMenuViewController: SideMenuDelegate {
    func tableViewManagerNeedsListOfSupportedLanguages() -> [Language]? {
        guard let presenter = presenter else {
            return nil
        }
        return presenter.viewNeedsListOfSupportedLanguages()
    }

    func viewDidPressLanguageSelectionButton(title: String) {
        presenter?.viewDidPressLanguageSelectionButton(title: title)
    }

    func tableViewManagerNeedsUserData(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem? {
        guard let presenter = presenter else {
            return nil
        }

        return presenter.tableManagerNeedsCurrencyItem(for: currentBalanceSection)
    }

    func tableViewManagerNeedsNavigationItem(for navigationSectionItem: NavigationSection) -> NavigationItem {
        guard let presenter = presenter else {
            fatalError("Presenter can not be nil")
        }
        return presenter.tableManagerNeedsSideMenuItem(for: navigationSectionItem)
    }
}

// MARK: - SideMenuViewInput
extension SideMenuViewController: SideMenuViewInput {
    func configureViews() {
    }
}

// MARK: Localizable
extension SideMenuViewController: Localizable {
    func localizationDidChange() {
        sideMenuView.reloadTableView()
    }
}

// MARK: - Private methods
extension SideMenuViewController {
    @objc func handleLocalizationChange() {
        guard let navigationController = self.navigationController else {
            return
        }
        for viewController in navigationController.viewControllers {
            guard let viewController = viewController as? Localizable else { return }
            viewController.localizationDidChange()
        }
    }
}
