// sourcery: AutoMockable
protocol SideMenuViewInput: AnyObject {
    func configureViews()
}

protocol SideMenuViewOutput {
    func viewDidLoad(_ view: SideMenuViewInput)
}

// sourcery: AutoMockable
protocol SideMenuInteractorInput {
}

// sourcery: AutoMockable
protocol SideMenuInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol SideMenuRouterInput {
}

protocol SideMenuRouterOutput: AnyObject {
}

protocol SideMenuModuleInput: AnyObject {
	func configureModule(output: SideMenuModuleOutput?)
}

// sourcery: AutoMockable
protocol SideMenuModuleOutput: AnyObject {
}
