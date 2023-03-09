import UIKit

class DishesCollectionView: UIView {

    private lazy var collectioView: CustomCollectionView = {
        let collectionView = CustomCollectionView()

        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods
extension DishesCollectionView {
    private func setupView() {

    }
}
