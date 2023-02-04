import Foundation
import SharedResources

protocol SideMenuItem {

}

enum SectionType: CaseIterable {
    case navigation
    case languageSelection
    case currentBalanceDisplay
}

enum NavigationSection: CaseIterable, SideMenuItem {
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
