import SharedResources
import UIKit
import SharedExtensions
import UIComponents
import SideMenu

final class MainScreenViewController: UIViewController {

    lazy var slideInMenuPadding: CGFloat = 0.65
    private var isMenuDisplayed = false
    let animationDuration = 0.2

    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()

    private let mainScreenView = MainScreenView()

    private lazy var sideMenuVeiewController: UIViewController = {
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
        displaySideMenu(animationDuration: animationDuration)
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

// MARK: SideMenuManager
extension MainScreenViewController: SideMenuManager {
    func toggleMenuDisplay() {
        removeSideMenu(animationDuration: animationDuration)
        isMenuDisplayed.toggle()
    }
}

// MARK: SideMenu
extension MainScreenViewController {
   private func removeSideMenu(animationDuration: Double) {
        overlayView.removeFromSuperview()
        // swiftlint:disable multiline_arguments
        UIView.animate(withDuration: animationDuration) {
            self.sideMenuVeiewController.view.transform = CGAffineTransform(
                translationX: self.sideMenuVeiewController.view.frame.width + 100, y: 0
            )
        } completion: { _ in
            self.sideMenuVeiewController.remove()
        }
    }
    // swiftlint:enable multiline_arguments

    private func displaySideMenu(
        animationDuration: Double
    ) {
        isMenuDisplayed.toggle()

        mainScreenView.addSubview(overlayView)
        overlayView.alpha = 0.4
        overlayView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(mainScreenView.safeAreaLayoutGuide)
        }

        if isMenuDisplayed {
            add(sideMenuVeiewController)
            sideMenuVeiewController.view.snp.makeConstraints { make in
                make.height.equalToSuperview()
                make.trailing.equalToSuperview()
                make.width.equalTo(view.snp.width).multipliedBy(slideInMenuPadding)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            }
            view.layoutIfNeeded()
            sideMenuVeiewController.view.transform = CGAffineTransform(
                translationX: sideMenuVeiewController.view.frame.width + 100,
                y: 0
            )
            UIView.animate(withDuration: animationDuration) {
                self.sideMenuVeiewController.view.transform = .identity
            }
        } else {
            removeSideMenu(animationDuration: animationDuration)
        }
    }
}
