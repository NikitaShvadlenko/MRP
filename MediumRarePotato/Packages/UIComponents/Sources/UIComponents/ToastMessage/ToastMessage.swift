import UIKit
import SharedResources
import SnapKit

public final class ToastMessage: UIView {

    private var timer = Timer()
    private var timerOriginalDuration: Float
    private var timerRemainingDuration: Float

    private lazy var progressBar: UIProgressView = {
        let view = UIProgressView()
        view.progress = 1
        return view
    }()

    private lazy var messageSymbol: UIImageView = {
        let messageSymbol = UIImageView()

        return messageSymbol
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(font: FontFamily.Neucha.regular, size: 18)
        label.textColor = Asset.Colors.secondaryTextColor.color
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        return label
    }()

    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        let image = UIImage(sfSymbol: SFSymbol.closeSymbol)
        button.setImage(image, for: .normal)
        button.tintColor = Asset.Colors.ToastColors.grayCross.color
        button.addTarget(self, action: #selector(dismiss), for: .touchDown)
        return button
    }()

    public init(style: Style, message: String, timerDuration: Float) {
        let strategy = ToastStrategyFactory.strategy(for: style)
        self.timerOriginalDuration = timerDuration * 20
        self.timerRemainingDuration = self.timerOriginalDuration
        super.init(frame: .zero)
        strategy.setToastAssets(imageView: messageSymbol, progressBar: progressBar)
        label.text = message
        setupView()
        startTimer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods
extension ToastMessage {
    func setupView() {
        backgroundColor = Asset.Colors.ToastColors.backgroundColor.color
        layer.cornerRadius = 8

        [
            progressBar,
            messageSymbol,
            label,
            dismissButton
        ].forEach(addSubview(_:))

        progressBar.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(4)
        }

        messageSymbol.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(8)
            make.width.equalTo(30)
            make.height.equalTo(messageSymbol.snp.width)
        }

        dismissButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(8)
            make.width.equalTo(10)
            make.height.equalTo(10)
        }

        label.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(progressBar.snp.top)
            make.trailing.equalTo(dismissButton.snp.leading).offset(2)
            make.leading.equalTo(messageSymbol.snp.trailing).offset(8)
        }
    }

    // swiftlint:disable multiline_arguments
    @objc
    private func dismiss() {
        UIView.animate(withDuration: 0.2, delay: 0) {
            self.transform = CGAffineTransformMakeTranslation(0, 20)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0) {
                self.transform = CGAffineTransformMakeTranslation(0, -300)
            } completion: { _ in
                self.removeFromSuperview()
            }
        }
    }
    // swiftlint:enable multiline_arguments
}

extension ToastMessage {
    public enum Style {
        case positive
        case negative
    }
}

// MARK: Timer
extension ToastMessage {
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.05,
            target: self,
            selector: #selector(timerFired),
            userInfo: nil,
            repeats: true
        )
    }

    @objc func timerFired() {
        if timerRemainingDuration > 0 {
            progressBar.progress = (timerRemainingDuration / timerOriginalDuration)
            timerRemainingDuration -= 1
        } else {
            timer.invalidate()
            dismiss()
        }
    }
}
