import UIKit
import SharedResources
import SnapKit
import UIComponents

final class MyRestaurantsView: UIView {

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.background)
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var searchBar: SearchBar = {
        let searchBar = SearchBar()
        return searchBar
    }()

    private lazy var collectionView: CustomCollectionView = {
        let collectionView = CustomCollectionView()
        collectionView.backgroundColor = .yellow
        collectionView.registerCollectionViewCell(RestaurantCollectionViewCell.self)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension MyRestaurantsView {
    private func configureViews() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide)
        }

        backgroundView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Public Methods
extension MyRestaurantsView {
    var searchBarDelegate: SearchBarDelegate? {
        get {
            searchBar.delegate
        }
        set {
            searchBar.delegate = newValue
        }
    }
}
