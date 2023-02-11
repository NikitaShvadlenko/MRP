import UIKit

final class SideMenuViewController: UIViewController {

    private let sideMenuView = SideMenuView()

    var presenter: SideMenuViewOutput?

    override func loadView() {
        view = sideMenuView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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

// MARK: - Private methods
extension SideMenuViewController {
}
