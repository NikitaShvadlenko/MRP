import UIKit

protocol SideMenuDelegate: AnyObject {
    func tableViewManagerNeedsNavigationItem(for navigationSectionItem: NavigationSection) -> NavigationItem
    func tableViewManagerNeedsUserData(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem?
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
            guard let currencyItem = delegate?.tableViewManagerNeedsUserData(
                for: CurrentBalanceSection.allCases[indexPath.row]
            ) else {
                return UITableViewCell()
            }

            cell.configure(currency: currencyItem.currencyName, amount: currencyItem.currencyQuantity)
            return cell

        case .languageSelection:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(LanguageSelectionCell.self)",
                for: indexPath
            ) as? LanguageSelectionCell else {
                fatalError("Could not deque cell")
            }
            cell.addButton(for: ["Ch", "Eng"])
            return cell

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.5, delay: 0) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
// MARK: - UITableViewDelegate
extension TableViewManager: UITableViewDelegate {
}
