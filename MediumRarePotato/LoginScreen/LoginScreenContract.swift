// sourcery: AutoMockable
protocol LoginScreenViewInput: AnyObject {
    func configureViews()
}

protocol LoginScreenViewOutput {
    func viewDidLoad(_ view: LoginScreenViewInput)
}

// sourcery: AutoMockable
protocol LoginScreenInteractorInput {
}

// sourcery: AutoMockable
protocol LoginScreenInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol LoginScreenRouterInput {
}

protocol LoginScreenRouterOutput: AnyObject {
}

protocol LoginScreenModuleInput: AnyObject {
	func configureModule(output: LoginScreenModuleOutput?)
}

// sourcery: AutoMockable
protocol LoginScreenModuleOutput: AnyObject {
}
