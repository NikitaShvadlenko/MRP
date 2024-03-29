import UIKit
import SnapKit
import SharedResources

public class RestaurantCollectionViewCell: UICollectionViewCell {

    private lazy var restaurantImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Restaurants.mediumWell)
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var restaurantDetailsView: RestaurantDetailsView = {
        let view = RestaurantDetailsView()
        return view
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 30)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var foodImage1: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Food.buffalo)
        view.contentMode = .redraw
        return view
    }()

    private lazy var foodImage2: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Food.borscht)
        view.contentMode = .redraw
        return view
    }()

    private lazy var foodImage3: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Food.lobster)
        view.contentMode = .redraw
        return view
    }()

    private lazy var displayDishesButton: CustomButton = {
        let button = CustomButton(title: L10n.login())
        return button
    }()

    private lazy var cookButton: CustomButton = {
        let button = CustomButton(title: L10n.cook())
        return button
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    override public func layoutSubviews() {
        layer.borderWidth = 1
        layer.borderColor = Asset.Colors.uiElementsColor.color.cgColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension RestaurantCollectionViewCell {
    private func setupView() {
        addSubview(restaurantImage)
        addSubview(restaurantDetailsView)
        addSubview(nameLabel)

        let distanceFromBorder = 12

        restaurantImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(distanceFromBorder)
            make.leading.equalToSuperview().inset(distanceFromBorder)
            make.height.equalToSuperview().multipliedBy(0.34)
            make.width.equalTo(restaurantImage.snp.height).multipliedBy(0.71)
        }

        restaurantDetailsView.snp.makeConstraints { make in
            make.top.equalTo(restaurantImage)
            make.bottom.equalTo(restaurantImage)
            make.leading.equalTo(restaurantImage.snp.trailing).offset(distanceFromBorder)
            make.trailing.equalToSuperview()
        }

        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(distanceFromBorder)
            make.top.equalTo(restaurantImage.snp.bottom).offset(distanceFromBorder)

        }
    }
}
