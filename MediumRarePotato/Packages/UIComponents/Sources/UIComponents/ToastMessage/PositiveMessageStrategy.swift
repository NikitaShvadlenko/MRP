import UIKit
import SharedResources

struct PositiveMessageStrategy: ToastStrategy {
    func setToastAssets(imageView: UIImageView, progressBar: UIProgressView) {
        imageView.image = UIImage(sfSymbol: SFSymbol.checkMarkCircle)?
            .withTintColor(Asset.Colors.ToastColors.greenCheckmark.color,
                           renderingMode: .alwaysOriginal)
        progressBar.tintColor = Asset.Colors.ToastColors.greenProgressline.color
    }
}
