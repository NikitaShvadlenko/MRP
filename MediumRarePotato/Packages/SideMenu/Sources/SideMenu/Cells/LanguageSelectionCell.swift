import UIKit
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

// MARK: Private functions
extension LanguageSelectionCell {
    func setupView() {
        backgroundColor = .clear
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}

// MARK: Public methods
extension LanguageSelectionCell {
    public func addButton(for languageTitles: [String]) {
        for language in 0 ..< languageTitles.count {
            let button = CustomButton(frame: .zero, title: languageTitles[language])
            stackView.addArrangedSubview(button)
        }
        layoutSubviews()
    }
}
