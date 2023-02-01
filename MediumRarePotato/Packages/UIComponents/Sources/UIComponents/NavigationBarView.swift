import UIKit
import SharedResources
import SnapKit

public final class NavigationBarTitleView: UIView {

    public weak var delegate: ButtonActionDelegate?

    private lazy var logoView: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(asset: Asset.Assets.logo), for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        return button
    }()

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

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Private methods
extension NavigationBarTitleView {
    private func setupView() {
        [
            logoView,
            titleLabel
        ].forEach(addSubview(_:))

        logoView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(4)
            make.leading.equalToSuperview()
            make.height.equalTo(logoView.snp.width)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(logoView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.height.equalTo(self.snp.height)
            make.width.equalTo(230)
        }
    }

    @objc
    private func buttonPressed() {
        delegate?.buttonPressed()
    }
}
