import UIKit
import SnapKit

class CustomCollectionView: UIView {

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Constants.spaceBetweenCells
        layout.minimumInteritemSpacing = Constants.spaceBetweenCells
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 10)
        return layout
    }()

    private var collectionViewHeightConstraint: LayoutConstraint?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let width = collectionView.frame.width
        let height = collectionViewHeightForWidth(width: width)
        collectionViewHeightConstraint?.constant = height
        self.layoutIfNeeded()
    }
}

// MARK: - Public methods
extension CustomCollectionView {
    public func registerCollectionViewCell(_ cellClass: UICollectionViewCell.Type) {
        let reuseIdentifier = String(describing: cellClass)
        collectionView.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
    }

    var dataSource: UICollectionViewDataSource? {
        get {
            collectionView.dataSource
        }
        set {
            collectionView.dataSource = newValue
        }
    }

    var delegate: UICollectionViewDelegate? {
        get {
            collectionView.delegate
        }
        set {
            collectionView.delegate = newValue
        }
    }

    func reloadCollection() {
        collectionView.reloadData()
    }
}

// MARK: - PrivateMethods
extension CustomCollectionView {

    private func setupViews() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            self.collectionViewHeightConstraint = make.height.equalTo(1).constraint.layoutConstraints.first
        }
    }

    private func collectionViewHeightForWidth(width: CGFloat) -> CGFloat {
        let spacing = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * Constants.spacesBetweenCellsCount
        let itemDimension = (availableWidth / Constants.shownCellsCount).rounded(.down)
        return itemDimension
    }

}

extension CustomCollectionView {
    private enum Constants {
        static let spaceBetweenCells: CGFloat = 40
        static let spacesBetweenCellsCount: CGFloat = shownCellsCount.rounded() - 1
        static let shownCellsCount: CGFloat = 1
    }
}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionViewHeightForWidth(width: width)
        return CGSize(width: height, height: height)
    }
}
