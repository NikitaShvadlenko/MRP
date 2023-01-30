// sourcery: AutoMockable
protocol MainScreenViewInput: AnyObject {
    func configureViews()
}

protocol MainScreenViewOutput {
    func viewDidLoad(_ view: MainScreenViewInput)
}

// sourcery: AutoMockable
protocol MainScreenInteractorInput {
}

// sourcery: AutoMockable
protocol MainScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol MainScreenRouterInput {
}

protocol MainScreenRouterOutput: AnyObject {
}

public protocol MainScreenModuleInput: AnyObject {
	func configureModule(output: MainScreenModuleOutput?)
}

// sourcery: AutoMockable
public protocol MainScreenModuleOutput: AnyObject {
}
