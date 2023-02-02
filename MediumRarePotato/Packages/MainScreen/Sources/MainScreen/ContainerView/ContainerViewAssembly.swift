import UIKit
import Utils

enum ContainerViewAssembly {
    static func assemble() -> AssembledModule<ContainerViewModuleInput> {
        let viewController = ContainerViewViewController()
        let presenter = ContainerViewPresenter()
        let interactor = ContainerViewInteractor()
        let router = ContainerViewRouter()

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
