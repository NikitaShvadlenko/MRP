import UIKit
import SharedResources
import SnapKit

final class SideMenuView: UIView {

    public var dataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = dataSource
        }
    }

    private lazy var backgroundView: UIView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.background)
        return view
    }()

     private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundView = backgroundView
        tableView.estimatedRowHeight = 200
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = false
        tableView.register(NavigationTableViewCell.self, forCellReuseIdentifier: "\(NavigationTableViewCell.self)")
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    override func layoutSubviews() {
        addSideLine(to: self)
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

    private func addSideLine(to view: UIView) {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 0.2, height: view.frame.height)
        layer.backgroundColor = Asset.Colors.uiElementsColor.color.cgColor
        view.layer.addSublayer(layer)
    }
}

// MARK: Public Methods
extension SideMenuView {
}
