import UIKit
import SnapKit
import SharedExtensions

public class CustomTextField: UIView {

    private lazy var backgroundView: UIView = {
        let view = UIView()

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
