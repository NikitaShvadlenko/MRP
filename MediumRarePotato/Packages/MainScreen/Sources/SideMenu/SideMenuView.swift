import UIKit

final class SideMenuView: UIView {
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
extension SideMenuView {
    private func configureViews() {
        backgroundColor = .white
    }
}
