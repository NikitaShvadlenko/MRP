import UIKit
import SnapKit

public enum CustomCollectionViewLayout {
    case horizontal
    case vertical
}

public class CustomCollectionView: UIView {

    private var layout: CustomCollectionViewLayout
    private var shownCardsCount: CGFloat

    private var padding: CGFloat

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
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        return layout
    }()

    public init(shownCardsCount: CGFloat, padding: CGFloat, layout: CustomCollectionViewLayout) {
        self.padding = padding
        self.shownCardsCount = shownCardsCount
        self.layout = layout
        super.init(frame: .zero)
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
    public func setScrollDirection(_ scrollDirection: UICollectionView.ScrollDirection) {
        flowLayout.scrollDirection = scrollDirection
        layoutSubviews()
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

    private func collectionViewHeightForWidth(width: CGFloat) -> CGFloat {
        let height = width / 5 * 7
        return height
    }
}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        if layout == .vertical {
            let height = collectionView.bounds.height / shownCardsCount - padding * 2
            let width = collectionViewWidthForHieght(height: height)
            return CGSize(width: width, height: height)
        } else {
            let width = collectionView.bounds.width / shownCardsCount - padding * 2
            let height = collectionViewHeightForWidth(width: width)
            return CGSize(width: width, height: height)
        }
    }
}
