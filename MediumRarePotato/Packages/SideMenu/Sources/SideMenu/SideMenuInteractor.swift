import UIKit
import SharedResources
import GameData

final class SideMenuInteractor {
    weak var presenter: SideMenuInteractorOutput?
    var gameDataManager: GameDataManagerProtocol?
}

// MARK: - SideMenuInteractorInput
extension SideMenuInteractor: SideMenuInteractorInput {
    func changeDefaultLocalization(_ languageKey: String) {
        print("Changing language to... ", languageKey)
    }

    func retrieveUserData(for currentBalanceSection: CurrentBalanceSection) -> CurrencyItem? {
        guard let userData = gameDataManager?.retrieveUserData() else {
            return nil
        }

        switch currentBalanceSection {
        case .mrb:
            return CurrencyItem(currencyName: L10n.Currency.mrb, currencyQuantity: userData.user.balance_mrb)

        case .mrp:
            return CurrencyItem(currencyName: L10n.Currency.mrp, currencyQuantity: userData.user.balance_mrp)
        }
    }

    // swiftlint:disable all
    func fetchNavigationSectionItem(for navigationSection: NavigationSection) -> NavigationItem {
        switch navigationSection {
        case .bars:
            return NavigationItem(name: L10n.MenuItems.bars, image: UIImage(asset: Asset.Assets.Icons.bars) ?? UIImage())
        case .myBars:
            return NavigationItem(name: L10n.MenuItems.myBars, image: UIImage(asset: Asset.Assets.Icons.bars) ?? UIImage())
        case .restaurants:
            return NavigationItem(name: L10n.MenuItems.restaurants, image: UIImage(asset: Asset.Assets.Icons.restaurantsIcon) ?? UIImage())
        case .myRestaurants:
            return NavigationItem(name: L10n.MenuItems.myRestaurants, image: UIImage(asset: Asset.Assets.Icons.restaurantsIcon) ?? UIImage())
        case .characters:
            return NavigationItem(name: L10n.MenuItems.characters, image: UIImage(asset: Asset.Assets.Icons.characters) ?? UIImage())
        case .pvpCooks:
            return NavigationItem(name: L10n.MenuItems.pvpCooks, image: UIImage(asset: Asset.Assets.Icons.pvpCooks) ?? UIImage())
        case .dishPool:
            return NavigationItem(name: L10n.MenuItems.dishPool, image: UIImage(asset: Asset.Assets.Icons.dishPool) ?? UIImage())
        case .shop:
            return NavigationItem(name: L10n.MenuItems.shop, image: UIImage(asset: Asset.Assets.Icons.shop) ?? UIImage())
        case .craft:
            return NavigationItem(name: L10n.MenuItems.craft, image: UIImage(asset: Asset.Assets.Icons.craft) ?? UIImage())
        case .cakes:
            return NavigationItem(name: L10n.MenuItems.cakes, image: UIImage(asset: Asset.Assets.Icons.cakes) ?? UIImage())
        case .referrals:
            return NavigationItem(name: L10n.MenuItems.referrals, image: UIImage(asset: Asset.Assets.Icons.referrals) ?? UIImage())
        case .walletCards:
            return NavigationItem(name: L10n.MenuItems.walletCards, image: UIImage(asset: Asset.Assets.Icons.cards) ?? UIImage())
        case .gameCards:
            return NavigationItem(name: L10n.MenuItems.gameCards, image: UIImage(asset: Asset.Assets.Icons.cards) ?? UIImage())
        case .pvpRewards:
            return NavigationItem(name: L10n.MenuItems.pvpRewards, image: UIImage(asset: Asset.Assets.Icons.cards) ?? UIImage())
        case .wallet:
            return NavigationItem(name: L10n.MenuItems.wallet, image: UIImage(asset: Asset.Assets.Icons.coins) ?? UIImage())
        case .claims:
            return NavigationItem(name: L10n.MenuItems.claims, image: UIImage(asset: Asset.Assets.Icons.coins) ?? UIImage())
        case .transactions:
            return NavigationItem(name: L10n.MenuItems.transactions, image: UIImage(asset: Asset.Assets.Icons.coins) ?? UIImage())
        case .coupons:
            return NavigationItem(name: L10n.MenuItems.coupons, image: UIImage(asset: Asset.Assets.Icons.cards) ?? UIImage())
        case .logout:
            return NavigationItem(name: L10n.MenuItems.logout, image: UIImage(asset: Asset.Assets.Icons.logout) ?? UIImage())
        }
    }
    // swiftlint:enable all
}
    // MARK: - Private methods
extension SideMenuInteractor {

}
