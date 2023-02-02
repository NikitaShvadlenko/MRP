// sourcery: AutoMockable
protocol ContainerViewViewInput: AnyObject {
    func configureViews()
}

protocol ContainerViewViewOutput {
    func viewDidLoad(_ view: ContainerViewViewInput)
}

// sourcery: AutoMockable
protocol ContainerViewInteractorInput {
}

// sourcery: AutoMockable
protocol ContainerViewInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol ContainerViewRouterInput {
}

protocol ContainerViewRouterOutput: AnyObject {
}

protocol ContainerViewModuleInput: AnyObject {
	func configureModule(output: ContainerViewModuleOutput?)
}

// sourcery: AutoMockable
protocol ContainerViewModuleOutput: AnyObject {
}
