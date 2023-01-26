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

    @objc
    private func buttonPressed() {
        UIView.animate(withDuration: 0.1) {
            self.button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }

        UIView.animate(withDuration: 0.1) {
            self.button.transform = .identity
        }
        delegate?.buttonPressed()
    }
}
