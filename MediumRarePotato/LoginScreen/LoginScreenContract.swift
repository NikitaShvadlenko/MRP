// sourcery: AutoMockable
protocol LoginScreenViewInput: AnyObject {
    func configureViews()
    func showActivityIndicator()
    func removeActivityIndicator()
    func displayEmptyFieldToast()
}

protocol LoginScreenViewOutput {
    func viewDidLoad(_ view: LoginScreenViewInput)
    func viewDidTapLoginButton(_ view: LoginScreenViewInput, token: String?)
}

// sourcery: AutoMockable
protocol LoginScreenInteractorInput {
    func login(with apiKey: String?)
}

// sourcery: AutoMockable
protocol LoginScreenInteractorOutput: AnyObject {
    func interactorSentRequest(_ interactor: LoginScreenInteractorInput)
    func interactorRequestComplete(_ interactor: LoginScreenInteractorInput)
    func intercatorReceivedEmptyTokenField(_ interactor: LoginScreenInteractorInput)
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
