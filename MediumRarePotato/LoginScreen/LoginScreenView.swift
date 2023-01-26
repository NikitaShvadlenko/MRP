import UIKit
import SharedResources
import SnapKit
import UIComponents

final class LoginScreenView: UIView {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                loginLabel,
                tokenInputWindow,
                fillerView,
                loginButton,
                fillerView
            ]
        )
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let fillerView = UIView()

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
        let view = CustomTextField(frame: self.frame, placeholder: L10n.tokenPlaceholder)
        return view
    }()

    private lazy var loginButton: CustomButton = {
        let button = CustomButton(frame: self.frame, title: L10n.login)
        return button
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
        backgroundView.addSubview(stackView)

        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(backgroundView.snp.height).multipliedBy(0.3)
            make.width.equalToSuperview()
        }

        loginButton.snp.makeConstraints { make in
            make.width.equalTo(120)
        }

        tokenInputWindow.snp.makeConstraints { make in
            make.width.equalTo(backgroundView).multipliedBy(0.9)
        }
    }
}

// MARK: Public Methods
extension LoginScreenView {

    var token: String? {
            tokenInputWindow.text
    }

    weak var buttonDelegate: ButtonActionDelegate? {
        get {
            loginButton.delegate
        }
        set {
            loginButton.delegate = newValue
        }
    }

    weak var textFieldDelegate: UITextFieldDelegate? {
        get {
            tokenInputWindow.delegate
        }
        set {
            tokenInputWindow.delegate = newValue
        }
    }
}
