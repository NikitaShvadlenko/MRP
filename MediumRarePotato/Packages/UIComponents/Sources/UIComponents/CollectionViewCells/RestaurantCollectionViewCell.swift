import UIKit
import SnapKit
import SharedResources

public class RestaurantCollectionViewCell: UICollectionViewCell {

    private let horizontalEmptySpace = 10

    private lazy var numberOfPeopleIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .redraw
        return view
    }()

    private lazy var percentageIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .redraw
        return view
    }()

    private lazy var timeIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .redraw
        return view
    }()

    private lazy var chefIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .redraw
        return view
    }()

    private lazy var restaurantImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .redraw
        return view
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
