import Foundation

final class MainScreenPresenter {
    weak var view: MainScreenViewInput?
    weak var moduleOutput: MainScreenModuleOutput?
    var interactor: MainScreenInteractorInput?
    var router: MainScreenRouterInput?
}

// MARK: - MainScreenViewOutput
extension MainScreenPresenter: MainScreenViewOutput {

    func viewDidLoad(_ view: MainScreenViewInput) {
        view.configureViews()
    }

    func viewPressedLogoButton(_ view: MainScreenViewInput) {
        print("Routing to restaurants window...")
    }

    func viewPressedSideMenuButton(_ view: MainScreenViewInput) {
        print("Showing side menu...")
    }

}

// MARK: - MainScreenInteractorOutput
extension MainScreenPresenter: MainScreenInteractorOutput {
}

// MARK: - MainScreenRouterOutput
extension MainScreenPresenter: MainScreenRouterOutput {
}

// MARK: - MainScreenModuleInput
extension MainScreenPresenter: MainScreenModuleInput {
    func configureModule(output: MainScreenModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension MainScreenPresenter {
}
