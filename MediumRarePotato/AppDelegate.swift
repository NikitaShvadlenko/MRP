import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var coreDataService = ServiceFactory.shared.coreDataService

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        coreDataService.loadContainer { [weak self] in
            let employeesListModule = EmployeesListAssembly.assemble()

            let navigationController = UINavigationController(
                rootViewController: employeesListModule.viewController
            )

            self?.window?.rootViewController = navigationController
            self?.window?.makeKeyAndVisible()
        }

        return true
    }
}
