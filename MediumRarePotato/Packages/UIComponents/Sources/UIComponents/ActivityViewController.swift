import UIKit
import SharedResources
import SnapKit

public class ActivityViewController: UIViewController {

   public init() {
        super.init(nibName: nil, bundle: nil)
    }

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.color = Asset.Colors.uiElementsColor.color
        view.layer.speed = 1.8
        view.startAnimating()
        return view
    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: Private methods
extension ActivityViewController {
    private func setupView() {
        view.backgroundColor = .black
        view.alpha = 0.4
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(activityIndicator.snp.height)
        }
    }
}
