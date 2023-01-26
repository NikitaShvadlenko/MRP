import UIKit
import SharedResources
import SnapKit

protocol ButtonDelegateProtocol: AnyObject {
    func buttonPressed()
}

public class CustomButton: UIButton {

    var title: String
    weak var delegate: ButtonDelegateProtocol?

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

    public init(frame: CGRect, title: String) {
        self.title = title
        super.init(frame: frame)
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

    private func touchIn() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .curveEaseOut]) {
            self.button.backgroundColor = Asset.Colors.uiElementsColor.color
            self.button.transform = .init(scaleX: 0.8, y: 0.8)
        }
    }

    private func touchOut() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.allowUserInteraction, .curveEaseIn]) {
            self.button.backgroundColor = .none
            self.button.transform = .identity
        }
    }

    @objc
    private func buttonPressed() {
        touchIn()
        delegate?.buttonPressed()
        touchOut()

    }
}
