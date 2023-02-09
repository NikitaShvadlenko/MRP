// sourcery: AutoMockable
protocol MyRestaurantsViewInput: AnyObject {
    func configureViews()
}

protocol MyRestaurantsViewOutput {
    func viewDidLoad(_ view: MyRestaurantsViewInput)
}

// sourcery: AutoMockable
protocol MyRestaurantsInteractorInput {
}

// sourcery: AutoMockable
protocol MyRestaurantsInteractorOutput: AnyObject {
}

// sourcery: AutoMockable
protocol MyRestaurantsRouterInput {
}

protocol MyRestaurantsRouterOutput: AnyObject {
}

public protocol MyRestaurantsModuleInput: AnyObject {
	func configureModule(output: MyRestaurantsModuleOutput?)
}

// sourcery: AutoMockable
public protocol MyRestaurantsModuleOutput: AnyObject {
}
