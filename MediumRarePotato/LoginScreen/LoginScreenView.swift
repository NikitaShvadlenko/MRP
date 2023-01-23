import UIKit
import SharedResources
import SnapKit

final class LoginScreenView: UIView {

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(asset: Asset.Assets.background)
        return view
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
extension LoginScreenView {
    private func configureViews() {
        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
