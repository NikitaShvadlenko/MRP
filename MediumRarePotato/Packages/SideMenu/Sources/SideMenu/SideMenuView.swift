import UIKit
import SharedResources
import SnapKit

final class SideMenuView: UIView {

    public var dataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = dataSource
        }
    }

    public var delegate: UITableViewDelegate? {
        didSet {
            tableView.delegate = delegate
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
        tableView.estimatedRowHeight = 250
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelection = false
        tableView.register(NavigationTableViewCell.self, forCellReuseIdentifier: "\(NavigationTableViewCell.self)")
        tableView.register(CurrencyCell.self, forCellReuseIdentifier: "\(CurrencyCell.self)")
        tableView.register(LanguageSelectionCell.self, forCellReuseIdentifier: "\(LanguageSelectionCell.self)")
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
            make.top.leading.trailing.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.height.equalToSuperview().multipliedBy(0.86).priority(.high)
        }
    }

    private func addSideLine(to view: UIView) {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 0.5, height: view.frame.height)
        layer.backgroundColor = Asset.Colors.uiElementsColor.color.cgColor
        view.layer.addSublayer(layer)
    }
}

// MARK: Public Methods
extension SideMenuView {
    public func reloadTableView() {
        tableView.reloadData()
    }
}
