import UIKit
import SnapKit

public class CustomCollectionView: UIView {
    public var shownCardsCount: CGFloat? {
        didSet {
            layoutSubviews()
        }
    }

    public var padding: CGFloat? {
        didSet {
            guard let padding else { return }
            flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            layoutSubviews()
        }
    }

    private var collectionViewHeightConstraint: LayoutConstraint?

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: self.frame, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
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
    public func setupConstants() {

    }

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

    public func reloadCollection() {
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

    private func collectionViewWidthForHieght(height: CGFloat) -> CGFloat {
        let width = height / 7 * 5
        return width
    }
}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let shownCardsCount else {
            return CGSize(width: 0, height: 0)
        }

        let height = collectionView.bounds.height / shownCardsCount
        let width = collectionViewWidthForHieght(height: height)
        return CGSize(width: width, height: height)
    }
}
