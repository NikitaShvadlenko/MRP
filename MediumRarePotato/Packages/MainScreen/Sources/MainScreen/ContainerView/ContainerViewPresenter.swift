import Foundation

final class ContainerViewPresenter {
    weak var view: ContainerViewViewInput?
    weak var moduleOutput: ContainerViewModuleOutput?
    var interactor: ContainerViewInteractorInput?
    var router: ContainerViewRouterInput?
}

// MARK: - ContainerViewViewOutput
extension ContainerViewPresenter: ContainerViewViewOutput {
    func viewDidLoad(_ view: ContainerViewViewInput) {
        view.configureViews()
    }
}

// MARK: - ContainerViewInteractorOutput
extension ContainerViewPresenter: ContainerViewInteractorOutput {
}

// MARK: - ContainerViewRouterOutput
extension ContainerViewPresenter: ContainerViewRouterOutput {
}

// MARK: - ContainerViewModuleInput
extension ContainerViewPresenter: ContainerViewModuleInput {
    func configureModule(output: ContainerViewModuleOutput?) {
        self.moduleOutput = output
    }
}

// MARK: - Private methods
extension ContainerViewPresenter {
}
