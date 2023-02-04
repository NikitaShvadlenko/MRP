import UIKit

protocol SideMenuDelegate: AnyObject {

}

final class TableViewManager: NSObject {
    let navigationItems = NavigationSection.allCases
    weak var delegate: SideMenuDelegate?
}

extension TableViewManager: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        SectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return NavigationSection.allCases.count

        case 1:
            return 1

        case 2:
            return 1

        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell()
            return cell
            // cell title = navigationItems[indexpath.row]
        case 1:
            return UITableViewCell() // language selection cell
        case 2:
            return UITableViewCell() // currency cell
        default:
            return UITableViewCell()
        }

    }
}
