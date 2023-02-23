import UIKit
import SharedResources

class DetailItem: UIView {
    let image: UIImage
    let text: String

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .left
        label.text = text
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var icon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = image
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                icon,
                label
            ])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        return stackView
    }()

    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailItem {
    private func setupView() {
        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        icon.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.height)
        }
    }
}
