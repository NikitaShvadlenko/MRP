import UIKit
import Utils
import GameData

public enum SideMenuAssembly {
    public static func assemble(containerViewController: UIViewController) -> AssembledModule<SideMenuModuleInput> {
        let viewController = SideMenuViewController()
        let presenter = SideMenuPresenter()
        let interactor = SideMenuInteractor()
        let router = SideMenuRouter()
        let tableViewManager = TableViewManager()
        let gameDataManager = GameDataFactory.shared.gameDataManager

        tableViewManager.delegate = viewController
        viewController.presenter = presenter
        viewController.setTableViewDataSource(tableViewManager)
        viewController.setTableViewDelegate(tableViewManager)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.gameDataManager = gameDataManager
        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter
        router.containerViewController = containerViewController

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
