import UIKit
import SharedResources
import SnapKit
import UIComponents

final class LoginScreenView: UIView, UITextFieldDelegate {

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.background)
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.text = SharedResources.L10n.enterAccessToken
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var tokenInputWindow: CustomTextField = {
        let view = CustomTextField(frame: self.frame, placeholder: L10n.tokenPlaceholder, delegate: self)

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
extension LoginScreenView {
    private func configureViews() {
        addSubview(backgroundView)
        backgroundView.addSubview(loginLabel)
        backgroundView.addSubview(tokenInputWindow)

        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        loginLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(0.75)
        }

        tokenInputWindow.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.equalTo(loginLabel.snp.bottom).offset(10)
            make.trailing.leading.equalToSuperview().inset(8)
        }
    }
}
