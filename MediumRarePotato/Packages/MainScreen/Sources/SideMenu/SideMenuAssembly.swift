import UIKit

enum SideMenuAssembly {
    static func assemble() -> AssembledModule<SideMenuModuleInput> {
        let viewController = SideMenuViewController()
        let presenter = SideMenuPresenter()
        let interactor = SideMenuInteractor()
        let router = SideMenuRouter()

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
