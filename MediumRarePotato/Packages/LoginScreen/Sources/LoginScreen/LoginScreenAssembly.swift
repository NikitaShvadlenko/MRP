import UIKit
import Utils
import Keychain
import Networking
import GameData

public enum LoginScreenAssembly {
    public static func assemble() -> AssembledModule<LoginScreenModuleInput> {
        let viewController = LoginScreenViewController()
        let presenter = LoginScreenPresenter()
        let interactor = LoginScreenInteractor()
        let router = LoginScreenRouter()
        let networkManager = NetworkingManagerFactory.shared.networkManager
        let gameDataManager = GameDataFactory.shared.gameDataManager
        let passwordManager = Keychain()
        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.gameDataManager = gameDataManager
        interactor.passwordManager = passwordManager
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
