import UIKit
import SharedResources
import SnapKit

class CurrencyCell: UITableViewCell {

    let currencyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Neucha.regular.name, size: 22)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = Asset.Colors.primaryTextColor.color
        return label
    }()

    let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontFamily.Neucha.regular.name, size: 22)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = Asset.Colors.currency.color
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private functions
extension CurrencyCell {
    func setupView() {
        backgroundColor = .clear
        [
            currencyLabel,
            amountLabel
        ].forEach(addSubview(_:))

        currencyLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(90)
            make.leading.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }

        amountLabel.snp.makeConstraints { make in
            make.leading.equalTo(currencyLabel.snp.trailing).offset(10)
            make.top.equalTo(currencyLabel.snp.top)
            make.bottom.equalTo(currencyLabel.snp.bottom)
            make.trailing.equalToSuperview().inset(10)
        }
    }
}

// MARK: Public functions
extension CurrencyCell {
    public func configure(currency: String, amount: Float) {
        currencyLabel.text = currency
        amountLabel.text = String(format: "%.4f", amount)
    }
}
