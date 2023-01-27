import Foundation

enum ToastStrategyFactory {
    static func strategy(for style: ToastMessage.Style) -> ToastStrategy {
        switch style {
        case .positive:
            return PositiveMessageStrategy()

        case .negative:
            return NegativeMessageStrategy()
        }
    }
}
