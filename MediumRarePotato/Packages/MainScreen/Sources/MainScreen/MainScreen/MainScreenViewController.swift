import SharedResources
import UIKit
import SharedExtensions
import UIComponents

final class MainScreenViewController: UIViewController {

    lazy var slideInMenuPadding: CGFloat = 0.65

    private var isSlideMenuPresented = false

    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()

    private let mainScreenView = MainScreenView()

    private lazy var menuViewController: UIViewController = {
        let view = SideMenuAssembly.assemble().viewController
        return view
    }()

    private lazy var containerViewController: UIViewController = {
        let view = ContainerViewAssembly.assemble().viewController
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
        containerViewController.view.addSubview(overlayView)
        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        UIView.animate(withDuration: 0.5, delay: 0) {
            if !self.isSlideMenuPresented {
                self.overlayView.alpha = 0.4
            } else {
                self.overlayView.alpha = 0
            }
        }

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
