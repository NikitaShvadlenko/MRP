import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

            let loginScreenModule = LoginScreenAssembly.assemble()

            let navigationController = UINavigationController(
            rootViewController: loginScreenModule.viewController
            )

            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()

        return true
    }
}
