import UIKit
import SharedModels
import UIComponents

class LanguageSelectionCell: UITableViewCell {

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods
extension LanguageSelectionCell {
   private func setupView() {
        backgroundColor = .clear
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }

    private func removeAllSubviews(from view: UIView) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }
}

// MARK: Public methods
extension LanguageSelectionCell {
    public func addButton(for languages: [Language], delegate: CustomButtonActionDelegate) {
        removeAllSubviews(from: stackView)
        contentView.isUserInteractionEnabled = false
        for language in 0 ..< languages.count {
            let button = CustomButton(frame: .zero, title: languages[language].displayName)
            button.delegate = delegate
            stackView.addArrangedSubview(button)
        }
    }
}
