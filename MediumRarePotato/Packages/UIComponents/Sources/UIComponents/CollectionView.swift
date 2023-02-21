import UIKit
import SnapKit

public class CustomCollectionView: UIView {

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
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        return layout
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        setupViews()
        backgroundColor = .clear
        collectionView.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("Has not been implemented")
    }
}

// MARK: - Public methods
extension CustomCollectionView {
    public func registerCollectionViewCell(_ cellClass: UICollectionViewCell.Type) {
        let reuseIdentifier = String(describing: cellClass)
        collectionView.register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
    }

    public var dataSource: UICollectionViewDataSource? {
        get {
            collectionView.dataSource
        }
        set {
            collectionView.dataSource = newValue
        }
    }

    public var delegate: UICollectionViewDelegate? {
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
        }
    }

    private func collectionViewHeight(width: CGFloat) -> CGFloat {
        let height = width / 5 * 7
        return height
    }
}

extension CustomCollectionView {
    private enum Constants {
        static let spaceBetweenCells: CGFloat = 10
        static let spacesBetweenCellsCount: CGFloat = shownCellsCount.rounded() - 1
        static let shownCellsCount: CGFloat = 4
    }
}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (collectionView.bounds.width - 100)
        let height = collectionViewHeight(width: width)
        return CGSize(width: width, height: height)
    }
}
