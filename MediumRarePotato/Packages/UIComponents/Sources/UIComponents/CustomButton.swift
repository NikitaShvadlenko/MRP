import UIKit
import SharedResources
import SnapKit

public protocol CustomButtonActionDelegate: AnyObject {
    func buttonPressed(_ button: CustomButton)
}

public class CustomButton: UIView {

    public var title: String {
        didSet {
            button.setTitle(title, for: .normal)
        }
    }

    public weak var delegate: CustomButtonActionDelegate?

    private lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = Asset.Colors.secondaryTextColor.color
        button.layer.borderColor = Asset.Colors.uiElementsColor.color.cgColor
        button.titleLabel?.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 25)
        button.layer.borderWidth = 1
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    public init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        self.addSubview(button)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    // swiftlint:disable multiline_arguments
    private func animateTouch() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) {
            self.button.backgroundColor = Asset.Colors.uiElementsColor.color
            self.button.transform = .init(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: [.allowUserInteraction, .curveEaseIn]) {
                self.button.backgroundColor = .none
                self.button.transform = .identity
            }
        }
    }

    @objc
    private func buttonPressed() {
        animateTouch()
        delegate?.buttonPressed(self)
    }
}
