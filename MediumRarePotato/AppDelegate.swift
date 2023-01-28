import LoginScreen
import UIKit
import SharedResources
import Utils

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        FontRegister().registerAvailableFonts()
        let loginScreenViewController = LoginScreenBuilder.build()

        let navigationController = UINavigationController(
            rootViewController: loginScreenViewController
        )

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()

        return true
    }
}
