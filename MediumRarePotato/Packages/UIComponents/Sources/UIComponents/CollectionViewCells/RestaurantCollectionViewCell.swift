import UIKit
import SnapKit
import SharedResources

public class RestaurantCollectionViewCell: UICollectionViewCell {

    private let horizontalEmptySpace = 10

    let fillerView = UIView()

    private lazy var numberOfPeopleIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(asset: Asset.Assets.Icons.person)
        return view
    }()

    private lazy var percentageIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Icons.percent)
        view.contentMode = .redraw
        return view
    }()

    private lazy var timeIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Icons.time)
        view.contentMode = .redraw
        return view
    }()

    private lazy var chefIcon: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Icons.chef)
        view.contentMode = .redraw
        return view
    }()

    private lazy var restaurantImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.Restaurants.mediumWell)
        view.contentMode = .redraw
        return view
    }()

    private lazy var chefLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .left
        label.text = "Chef"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .left
        label.text = "12:00:00"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var comissionLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var numberOfPeopleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .left
        label.text = "122/140"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .left
        label.text = "ALALALLALALALALLALAL"
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
        let button = CustomButton(frame: .zero, title: L10n.login())
        return button
    }()

    private lazy var cookButton: CustomButton = {
        let button = CustomButton(frame: .zero, title: L10n.cook())
        return button
    }()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension RestaurantCollectionViewCell {
    private func setupView() {
        let hRestaurantNumberOfPeopleStack = UIStackView(arrangedSubviews: [
            numberOfPeopleIcon,
            numberOfPeopleLabel
        ])

        let hRestaurantCommissionStack = UIStackView(arrangedSubviews: [
            percentageIcon,
            comissionLabel
        ])

        let hRestaurantTimeStack = UIStackView(arrangedSubviews: [
            timeIcon,
            timeLabel
        ])

        let hRestaurantChefStack = UIStackView(arrangedSubviews: [
            chefIcon,
            chefLabel
        ])

        let vRestaurantDetailsStack = UIStackView(arrangedSubviews: [
            hRestaurantNumberOfPeopleStack,
            hRestaurantCommissionStack,
            hRestaurantTimeStack,
            hRestaurantChefStack
        ])

        let hRestaurantDetailsStack = UIStackView(
            arrangedSubviews: [
                restaurantImage,
                vRestaurantDetailsStack,
                fillerView
            ])

        let vRestaurantDetailNameStack = UIStackView(
            arrangedSubviews: [
                hRestaurantDetailsStack,
                nameLabel
            ]
        )

        let hFoodStack = UIStackView(arrangedSubviews: [
            foodImage1,
            foodImage2,
            foodImage3
        ])

        let vRestaurantFoodButtonStack = UIStackView(
            arrangedSubviews: [
                hFoodStack,
                displayDishesButton,
                cookButton
            ])

        let restaurantStack = UIStackView(arrangedSubviews: [
            vRestaurantDetailNameStack,
            vRestaurantFoodButtonStack
        ])

        backgroundColor = .clear
        addSubview(restaurantStack)
        restaurantStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        setupStackViews()

        func setupStackViews() {
            hRestaurantNumberOfPeopleStack.axis = .horizontal
            hRestaurantNumberOfPeopleStack.distribution = .fillEqually

            hRestaurantChefStack.axis = .horizontal
            hRestaurantChefStack.distribution = .fillEqually

            hRestaurantTimeStack.axis = .horizontal
            hRestaurantTimeStack.distribution = .fillEqually

            hRestaurantCommissionStack.axis = .horizontal
            hRestaurantCommissionStack.distribution = .fillEqually

            hRestaurantDetailsStack.axis = .horizontal
            hRestaurantDetailsStack.distribution = .fillProportionally

            vRestaurantDetailNameStack.axis = .vertical
            vRestaurantDetailsStack.distribution = .fillEqually
            vRestaurantDetailsStack.axis = .vertical

            hFoodStack.axis = .horizontal
            hFoodStack.spacing = 10
            hFoodStack.distribution = .fillEqually

            vRestaurantFoodButtonStack.distribution = .equalSpacing
            vRestaurantFoodButtonStack.axis = .vertical

            restaurantStack.axis = .vertical
            restaurantStack.distribution = .fillEqually
            restaurantStack.spacing = 10
        }
    }
}
