import UIKit
import SharedResources

class NegativeMessageStrategy: ToastStrategy {

    func setToastAssets(imageView: UIImageView, progressBar: UIProgressView) {
        imageView.image = UIImage(sfSymbol: SFSymbol.exclamationMark)?.withTintColor(Asset.Colors.ToastColors.redExclaimationMark.color, renderingMode: .alwaysOriginal)
        progressBar.tintColor = Asset.Colors.ToastColors.redProgressline.color
    }
}
