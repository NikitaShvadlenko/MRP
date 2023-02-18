import UIKit
import UIComponents

final class MyRestaurantsViewController: UIViewController {

    private let myRestaurantsView = MyRestaurantsView()

    var presenter: MyRestaurantsViewOutput?

    override func loadView() {
        view = myRestaurantsView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(self)
        setSearchFieldDelegate(delegate: self)
        registerTapGesture()
    }

    func setSearchFieldDelegate(delegate: SearchBarDelegate) {
        myRestaurantsView.searchBarDelegate = delegate
    }
}

// MARK: - MyRestaurantsViewInput
extension MyRestaurantsViewController: MyRestaurantsViewInput {
    func configureViews() {
    }
}

// MARK: - Private methods
extension MyRestaurantsViewController {
    private func registerTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}

// MARK: - SearchFieldDelegate
extension MyRestaurantsViewController: SearchBarDelegate {
    func searchButtonPressed(_ searchButton: UIButton) {
        print("Search button pressed")
    }

    func settingsButtonPressed(_ settingButton: UIButton) {
        print("Settings button pressed")
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
