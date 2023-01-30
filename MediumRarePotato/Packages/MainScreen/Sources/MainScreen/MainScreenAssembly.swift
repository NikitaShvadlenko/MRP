import UIKit
import Utils

public enum MainScreenAssembly {
    public static func assemble() -> AssembledModule<MainScreenModuleInput> {
        let viewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        viewController.navigationItem.hidesBackButton = true

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
