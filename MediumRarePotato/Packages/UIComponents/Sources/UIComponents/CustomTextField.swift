import UIKit
import SnapKit
import SharedResources

public class CustomTextField: UIView {

    var placeholder: String?
    public weak var delegate: UITextFieldDelegate?

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()

    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: FontFamily.AmaticSC.regular.name, size: 25)
        textField.textColor = Asset.Colors.secondaryTextColor.color
        textField.textAlignment = .center
        textField.contentVerticalAlignment = .bottom
        textField.borderStyle = .none
        textField.delegate = delegate
        if let placeholder = placeholder {
            textField.attributedPlaceholder = NSMutableAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: Asset.Colors.placeholderColor.color]
            )
        }
        return textField
    }()

    public init(frame: CGRect, placeholder: String?) {
        self.placeholder = placeholder
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func layoutSubviews() {
        addBottomLine(to: textField)
    }

    func setupView() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(textField)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }

    private func addBottomLine(to textField: UITextField) {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: textField.frame.height - 1, width: textField.frame.width, height: 1)
        layer.backgroundColor = Asset.Colors.uiElementsColor.color.cgColor
        textField.layer.addSublayer(layer)
    }
}
