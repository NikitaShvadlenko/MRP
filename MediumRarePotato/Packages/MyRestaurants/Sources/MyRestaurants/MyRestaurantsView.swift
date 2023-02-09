import UIKit
import SharedResources
import SnapKit

final class MyRestaurantsView: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.gameTitle
        label.font = UIFont(font: FontFamily.AmaticSC.bold, size: 30)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left
        label.sizeToFit()
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.background)
        return view
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
extension MyRestaurantsView {
    private func configureViews() {
        addSubview(backgroundView)
        backgroundView.addSubview(titleLabel)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(200)
        }
    }
}
