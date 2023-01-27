import UIKit
import SharedResources
import SnapKit

class ToastMessage: UIView {

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.isUserInteractionEnabled = true
        view.image = Asset.Assets.background.image
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods

extension ToastMessage {
    func setupView() {

    }
}
