import UIKit
import Utils
import Networking

enum LoginScreenAssembly {
    static func assemble() -> AssembledModule<LoginScreenModuleInput> {
        let viewController = LoginScreenViewController()
        let presenter = LoginScreenPresenter()
        let interactor = LoginScreenInteractor()
        let router = LoginScreenRouter()
        let networkManager = ManagerFactory.shared.networkManager

        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter
        interactor.networkManager = networkManager

        router.viewController = viewController
        router.presenter = presenter

        return AssembledModule(
            viewController: viewController,
            moduleInput: presenter
        )
    }
}
