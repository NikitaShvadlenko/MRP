import UIKit
import SnapKit
import SharedResources

public class RestaurantCollectionViewCell: UICollectionViewCell {

    private let horizontalEmptySpace = 10

    private lazy var numberOfPeopleIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .redraw
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
        view.contentMode = .redraw
        return view
    }()

    private lazy var chefLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.regular.name, size: 40)
        label.textAlignment = .center
        label.text = "Chef"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.regular.name, size: 40)
        label.textAlignment = .center
        label.text = "12:00:00"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var comissionLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont(name: FontFamily.AmaticSC.regular.name, size: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var numberOfPeopleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.regular.name, size: 40)
        label.textAlignment = .center
        label.text = "122/140"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.4
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

// MARK: - Private Methods
extension RestaurantCollectionViewCell {
    private func setupView() {

    }
}
