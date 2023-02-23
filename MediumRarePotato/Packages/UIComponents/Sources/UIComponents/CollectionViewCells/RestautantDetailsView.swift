import UIKit
import SharedResources

class RestaurantDetailsView: UIView {

    private let numberOfPeopleStack = DetailItem(
        image: UIImage(asset: Asset.Assets.Icons.person) ?? UIImage(),
        text: "132/140"
    )

    private let chefStack = DetailItem(
        image: UIImage(asset: Asset.Assets.Icons.chef) ?? UIImage(),
        text: "Chef"
    )

    private let comissionStack = DetailItem(
        image: UIImage(asset: Asset.Assets.Icons.percent) ?? UIImage(),
        text: "1"
    )

    private let timeStack = DetailItem(
        image: UIImage(asset: Asset.Assets.Icons.time) ?? UIImage(),
        text: "12:00:00"
    )

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(
            arrangedSubviews: [
                numberOfPeopleStack,
                comissionStack,
                timeStack,
                chefStack
            ])
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implenmented")
    }
}

extension RestaurantDetailsView {
    func setupView() {
        backgroundColor = .clear
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
