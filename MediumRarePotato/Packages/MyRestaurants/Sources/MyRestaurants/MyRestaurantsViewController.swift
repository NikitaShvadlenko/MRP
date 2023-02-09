import UIKit

final class MyRestaurantsViewController: UIViewController {

    private let myRestaurantsView = MyRestaurantsView()

    var presenter: MyRestaurantsViewOutput?

    override func loadView() {
        view = myRestaurantsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
    }
}

// MARK: - MyRestaurantsViewInput
extension MyRestaurantsViewController: MyRestaurantsViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension MyRestaurantsViewController {
}
