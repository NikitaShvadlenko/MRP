import UIKit
import SharedResources
import SnapKit

public class CustomButton: UIButton {
    var title: String

    private lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.textColor = Asset.Colors.secondaryTextColor.color
        button.layer.borderColor = Asset.Colors.uiElementsColor.color.cgColor
        button.titleLabel?.font = UIFont(name: FontFamily.AmaticSC.bold.name, size: 25)
        button.layer.borderWidth = 1
        button.setTitle(title, for: .normal)
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
}
