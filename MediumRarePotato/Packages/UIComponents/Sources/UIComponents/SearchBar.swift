import UIKit
import SnapKit
import SharedResources

public protocol SearchBarDelegate: UITextFieldDelegate {
    func searchButtonPressed(_ searchButton: UIButton)
    func settingsButtonPressed(_ settingButton: UIButton)
}

public class SearchBar: UIView {

    public var searchBarText: String {
        if let text = customTextField.text {
            return text
        } else {
            return ""
        }
    }

    public var delegate: SearchBarDelegate? {
        didSet {
            customTextField.delegate = delegate
        }
    }

    let largeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .regular, scale: .large)

    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        let backgroundImage = UIImage(sfSymbol: SFSymbol.settings)?
            .withConfiguration(largeSymbolConfiguration)
        button.setImage(backgroundImage, for: .normal)
        button.contentVerticalAlignment = .bottom
        button.tintColor = Asset.Colors.uiElementsColor.color
        button.contentMode = .scaleToFill
        button.addTarget(self, action: #selector(settingsButtonPressed), for: .touchDown)
        return button
    }()

    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.contentVerticalAlignment = .bottom
        button.tintColor = Asset.Colors.uiElementsColor.color
        let backgroundImage = UIImage(sfSymbol: SFSymbol.search)?.withConfiguration(largeSymbolConfiguration)
        button.setImage(backgroundImage, for: .normal)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchDown)
        return button
    }()

    private lazy var customTextField = CustomTextField(frame: .zero, placeholder: nil)

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: Private Methods
extension SearchBar {
    private func setupView() {
        [
            settingsButton,
            searchButton,
            customTextField
        ].forEach(addSubview(_:))

        settingsButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(10)
            make.height.equalTo(40)
            make.width.equalTo(settingsButton.snp.height)
        }

        searchButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().inset(10)
            make.height.equalTo(settingsButton.snp.height)
            make.width.equalTo(settingsButton.snp.width)
        }

        customTextField.snp.makeConstraints { make in
            make.leading.equalTo(settingsButton.snp.trailing)
            make.trailing.equalTo(searchButton.snp.leading)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }

    @objc
    private func settingsButtonPressed() {
        delegate?.settingsButtonPressed(settingsButton)
    }

    @objc
    private func searchButtonPressed() {
        delegate?.searchButtonPressed(searchButton)
    }
}

// MARK: Public Methods
extension SearchBar {
}
