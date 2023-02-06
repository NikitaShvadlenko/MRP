import UIKit
import Utils

public enum SideMenuAssembly {
    public static func assemble(containerViewController: UIViewController) -> AssembledModule<SideMenuModuleInput> {
        let viewController = SideMenuViewController()
        let presenter = SideMenuPresenter()
        let interactor = SideMenuInteractor()
        let router = SideMenuRouter()
        let dataSource = TableViewManager()

        viewController.presenter = presenter
        viewController.setTableViewDataSource(dataSource)

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

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
