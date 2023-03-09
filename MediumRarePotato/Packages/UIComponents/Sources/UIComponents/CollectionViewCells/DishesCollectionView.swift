import UIKit

class DishesCollectionView: UIView {

    private lazy var collectioView: CustomCollectionView = {
        let collectionView = CustomCollectionView(shownCardsCount: 3, padding: 12, layout: .horizontal)
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
