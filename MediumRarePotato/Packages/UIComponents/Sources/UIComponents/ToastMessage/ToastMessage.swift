import UIKit
import SharedResources
import SnapKit

final class ToastMessage: UIView {

    private var strategy: ToastStrategy

    private lazy var backgroundView: UIImageView = {
        let view = UIImageView()
        view.isUserInteractionEnabled = true
        view.image = Asset.Assets.background.image
        return view
    }()

    private lazy var progressBar: UIProgressView = {
        let view = UIProgressView()

        return view
    }()

    private lazy var messageSymbol: UIImageView = {
        let messageSymbol = UIImageView()

        return messageSymbol
    }()

    private lazy var label: UILabel = {
        let label = UILabel()

        return label
    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton()

        return button
    }()

    public init(frame: CGRect, strategy: ToastStrategy, message: String) {
        self.strategy = strategy
        super.init(frame: frame)
        strategy.setToastAssets(imageView: messageSymbol, progressBar: progressBar)
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
