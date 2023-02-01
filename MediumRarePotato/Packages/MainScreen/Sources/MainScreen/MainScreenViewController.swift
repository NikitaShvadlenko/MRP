import SharedResources
import UIKit
import SharedExtensions
import UIComponents

final class MainScreenViewController: UIViewController {

    lazy var slideInMenuPadding: CGFloat = 0.5

    private var isSlideMenuPresented = false

    private let mainScreenView = MainScreenView()

    private lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    var presenter: MainScreenViewOutput?

    override func loadView() {
        view = mainScreenView
        view.addSubview(menuView)
        menuView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalTo(self.view.snp.width).multipliedBy(slideInMenuPadding)
        }
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.top.leading.equalTo(self.view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
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
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0,
            options: .curveEaseInOut,
            animations: {
                switch self.isSlideMenuPresented {
                case true:
                    self.containerView.frame.origin.x = 0

                case false:
                    self.containerView.frame.origin.x = -(self.containerView.frame.width * self.slideInMenuPadding)
                }
            }, completion: {_ in
                self.isSlideMenuPresented.toggle()
            })
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
