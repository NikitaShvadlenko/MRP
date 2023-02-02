import SharedResources
import UIKit
import SharedExtensions
import UIComponents

final class MainScreenViewController: UIViewController {

    lazy var slideInMenuPadding: CGFloat = 0.5

    private var isSlideMenuPresented = false

    private let mainScreenView = MainScreenView()

    private lazy var menuViewController: UIViewController = {
        let view = UIViewController()
        view.view.backgroundColor = .red
        return view
    }()

    private lazy var containerViewController: UIViewController = {
        let view = UIViewController()
        view.view.backgroundColor = .blue
        return view
    }()

    var presenter: MainScreenViewOutput?

    override func loadView() {
        view = mainScreenView

        createSideMenu(
            menuViewController: menuViewController,
            containerViewController: containerViewController,
            padding: slideInMenuPadding
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {

    func configureViews() {
        configureNavigationBar()
    }

    func showSideMenu() {
        toggleSideMenu(
            menuViewController: menuViewController,
            containerViewController: containerViewController,
            isSlideMenuPresented: isSlideMenuPresented,
            padding: slideInMenuPadding
        ) {
            self.isSlideMenuPresented.toggle()
        }
    }

}
// MARK: - ButtonActionDelegate
extension MainScreenViewController: ButtonActionDelegate {
    func buttonPressed() {
        presenter?.viewPressedLogoButton(self)
    }
}

// MARK: - Private methods
extension MainScreenViewController {
    private func configureNavigationBar() {
        guard let navigationController = navigationController else { return }
        let customView = NavigationBarTitleView()
        customView.delegate = self

        let largeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)

        addBottomLine(to: navigationController.navigationBar)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(sfSymbol: SFSymbol.threeLinesHorizontal, withConfiguration: largeSymbolConfiguration),
            style: .plain,
            target: self,
            action: #selector(sideMenuButtonTapped)
        )

        navigationItem.rightBarButtonItem?.tintColor = SharedResources
            .Asset
            .Colors
            .uiElementsColor
            .color

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customView)

    }

    private func addBottomLine(to view: UIView) {
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: view.frame.height - 1, width: view.frame.width, height: 0.2)
        layer.backgroundColor = Asset.Colors.uiElementsColor.color.cgColor
        view.layer.addSublayer(layer)
    }

    @objc
    private func sideMenuButtonTapped() {
        presenter?.viewPressedSideMenuButton(self)
    }
}
