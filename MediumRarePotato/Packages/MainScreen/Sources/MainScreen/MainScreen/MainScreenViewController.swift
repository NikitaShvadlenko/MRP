import SharedResources
import UIKit
import SharedExtensions
import UIComponents
import SideMenu

final class MainScreenViewController: UIViewController {

    lazy var slideInMenuPadding: CGFloat = 0.65

    private var isMenuDisplayed = false

    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()

    private let mainScreenView = MainScreenView()

    private lazy var menuViewController: UIViewController = {
        let view = SideMenuAssembly.assemble(containerViewController: containerViewController).viewController
        return view
    }()

    private lazy var containerViewController: UIViewController = {
        let view = ContainerViewAssembly.assemble().viewController
        return view
    }()

    var presenter: MainScreenViewOutput?

    override func loadView() {
        view = mainScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        add(containerViewController)
        containerViewController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - MainScreenViewInput
extension MainScreenViewController: MainScreenViewInput {

    func configureViews() {
        configureNavigationBar()
    }

    func showSideMenu() {
        displaySideMenu(
            sideMenuViewController: menuViewController,
            padding: slideInMenuPadding,
            isMenuDisplayed: &isMenuDisplayed,
            animationDuration: 0.5
        )
    }

}
// MARK: - ButtonActionDelegate
extension MainScreenViewController: NavigationBarTitleViewButtonDelegate {
    func viewDidPressButton(_ button: UIButton) {
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
        layer.frame = CGRect(x: 0, y: view.frame.height - 1, width: view.frame.width, height: 0.5)
        layer.backgroundColor = Asset.Colors.uiElementsColor.color.cgColor
        view.layer.addSublayer(layer)
    }

    @objc
    private func sideMenuButtonTapped() {
        presenter?.viewPressedSideMenuButton(self)
    }
}
