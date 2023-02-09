import Foundation

final class MyRestaurantsPresenter {
    weak var view: MyRestaurantsViewInput?
    weak var moduleOutput: MyRestaurantsModuleOutput?
    var interactor: MyRestaurantsInteractorInput?
    var router: MyRestaurantsRouterInput?
}

// MARK: - MyRestaurantsViewOutput
extension MyRestaurantsPresenter: MyRestaurantsViewOutput {
    func viewDidLoad(_ view: MyRestaurantsViewInput) {
        view.configureViews()
    }
}

// MARK: - MyRestaurantsInteractorOutput
extension MyRestaurantsPresenter: MyRestaurantsInteractorOutput {
}

// MARK: - MyRestaurantsRouterOutput
extension MyRestaurantsPresenter: MyRestaurantsRouterOutput {
}

// MARK: - MyRestaurantsModuleInput
extension MyRestaurantsPresenter: MyRestaurantsModuleInput {
    func configureModule(output: MyRestaurantsModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension MyRestaurantsPresenter {
}
