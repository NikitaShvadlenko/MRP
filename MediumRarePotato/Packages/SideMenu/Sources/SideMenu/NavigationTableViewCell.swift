import UIKit
import SharedResources
import SnapKit

class NavigationTableViewCell: UITableViewCell {

    let navigationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Neucha.regular.name, size: 25)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = SharedResources.L10n.MenuItems.myRestaurants
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(sfSymbol: SFSymbol.closeSymbol)
        imageView.tintColor = Asset.Colors.uiElementsColor.color
        return imageView
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
extension NavigationTableViewCell {
    func setupView() {
        backgroundColor = .clear
        [
            navigationLabel,
            image
        ].forEach(addSubview(_:))

        image.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(image.snp.height)
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }

        navigationLabel.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.trailing).offset(10)
            make.top.equalTo(image.snp.top)
            make.bottom.equalTo(image.snp.bottom)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}
