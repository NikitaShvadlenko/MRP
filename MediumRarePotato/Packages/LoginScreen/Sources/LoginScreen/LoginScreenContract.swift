import SharedModels
// sourcery: AutoMockable
protocol LoginScreenViewInput: AnyObject {
    func configureViews()
    func showActivityIndicator()
    func removeActivityIndicator()
    func displayEmptyFieldToast()
    func displayNegativeToast(error: String)
}

protocol LoginScreenViewOutput {
    func viewDidLoad(_ view: LoginScreenViewInput)
    func viewDidTapLoginButton(_ view: LoginScreenViewInput, token: String?)
}

// sourcery: AutoMockable
protocol LoginScreenInteractorInput {
    func login(with apiKey: String?)
    func retrievePassword() -> String?
    func saveUserData(_ data: UserData)
}

// sourcery: AutoMockable
protocol LoginScreenInteractorOutput: AnyObject {
    func interactorSentRequest(_ interactor: LoginScreenInteractorInput)
    func interactor(_ interactor: LoginScreenInteractorInput, didReceiveError error: String)
    func interactor(_ interactor: LoginScreenInteractorInput, didReceiveUserData data: UserData, key: String)
    func intercatorReceivedEmptyTokenField(_ interactor: LoginScreenInteractorInput)
}

// sourcery: AutoMockable
protocol LoginScreenRouterInput {
    func routeToMainScreen()
}

protocol LoginScreenRouterOutput: AnyObject {
}

public protocol LoginScreenModuleInput: AnyObject {
	func configureModule(output: LoginScreenModuleOutput?)
}

// sourcery: AutoMockable
public protocol LoginScreenModuleOutput: AnyObject {
}
