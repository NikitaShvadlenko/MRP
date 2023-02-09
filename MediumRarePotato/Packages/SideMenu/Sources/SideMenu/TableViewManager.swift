import UIKit

protocol SideMenuDelegate: AnyObject {
    func tableViewManagerNeedsNavigationItem(for navigationSectionItem: NavigationSection) -> NavigationItem
}

final class TableViewManager: NSObject {
    let navigationItems = NavigationSection.allCases
    public weak var delegate: SideMenuDelegate?
}

extension TableViewManager: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        SectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch SectionType(rawValue: section) {
        case .navigation:
            return NavigationSection.allCases.count

        case .currentBalanceDisplay:
            return CurrentBalanceSection.allCases.count

        case .languageSelection:
            return LanguageSelectionSection.allCases.count

        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch SectionType(rawValue: indexPath.section) {
        case .navigation:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(NavigationTableViewCell.self)",
                for: indexPath
            ) as? NavigationTableViewCell else {
                fatalError("Could not deque cell")
            }
            guard let item = delegate?.tableViewManagerNeedsNavigationItem(
                for: NavigationSection.allCases[indexPath.row]
            ) else {
                fatalError("Could not get item")
            }
            cell.configure(icon: item.image, name: item.name)
            return cell

        case .currentBalanceDisplay:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(CurrencyCell.self)",
                for: indexPath
            ) as? CurrencyCell else {
                fatalError("Could not deque cell")
            }
            cell.configure(currency: "MRP", amount: 50012.4441114)
            return cell

        case .languageSelection:
            // create a switcher in a cell (no need to implement functionality yet)
            return UITableViewCell()

        default:
            return UITableViewCell()
        }
    }
}
// MARK: - UITableViewDelegate
extension TableViewManager: UITableViewDelegate {
}
