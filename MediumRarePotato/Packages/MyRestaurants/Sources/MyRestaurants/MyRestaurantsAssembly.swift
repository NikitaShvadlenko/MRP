import UIKit
import Utils

public enum MyRestaurantsAssembly {
   public static func assemble() -> AssembledModule<MyRestaurantsModuleInput> {
        let viewController = MyRestaurantsViewController()
        let presenter = MyRestaurantsPresenter()
        let interactor = MyRestaurantsInteractor()
        let router = MyRestaurantsRouter()

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
