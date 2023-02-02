import UIKit

final class ContainerViewViewController: UIViewController {

    private let containerViewView = ContainerViewView()

    var presenter: ContainerViewViewOutput?

    override func loadView() {
        view = containerViewView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - ContainerViewViewInput
extension ContainerViewViewController: ContainerViewViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension ContainerViewViewController {
}
