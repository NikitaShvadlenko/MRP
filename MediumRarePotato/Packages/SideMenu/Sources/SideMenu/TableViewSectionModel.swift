import UIKit
import SharedResources

enum SectionType: Int, CaseIterable {
    case navigation
    case languageSelection
    case currentBalanceDisplay
}

enum LanguageSelectionSection: CaseIterable {
    case languageSelection
}

enum CurrentBalanceSection: CaseIterable {
    case mrp
    case mrb
}

enum NavigationSection: CaseIterable {
    case bars
    case myBars
    case restaurants
    case myRestaurants
    case characters
    case pvpCooks
    case dishPool
    case shop
    case craft
    case cakes
    case referrals
    case walletCards
    case gameCards
    case pvpRewards
    case wallet
    case claims
    case transactions
    case coupons
    case logout
}

struct NavigationItem {
    let name: String
    let image: UIImage
}

struct CurrencyItem {
    var currencyName: String
    var currencyQuantity: Float
}
