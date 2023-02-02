import UIKit
import SharedResources
import SnapKit

final class SideMenuView: UIView {

    private lazy var backgroundView: UIView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.background)
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundView = backgroundView
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension SideMenuView {
    private func configureViews() {

        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
