import UIKit

protocol SideMenuDelegate: AnyObject {
    func routeTo()
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
            // create a function that takes NavigationSection case and returns the string and image to setup the cell.
            // (+ create a configuration function for the cell)

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "\(NavigationTableViewCell.self)",
                for: indexPath
            ) as? NavigationTableViewCell else {
                fatalError("Could not deque cell")
            }

            return cell

        case .currentBalanceDisplay:
            // create a function that would take the balance data and configure a custom cell with it
            return UITableViewCell()

        case .languageSelection:
            // create a switcher in a cell (no need to implement functionality yet)
            return UITableViewCell()

        default:
            return UITableViewCell()
        }
    }
}
