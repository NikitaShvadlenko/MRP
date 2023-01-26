import UIKit

protocol LoginDelegateProtocol: AnyObject, UITextFieldDelegate {
    var textFieldEntry: String { get set }

    func buttonPressed()
}

class LoginDelegate: NSObject {
    override public init() {
        super.init()
    }
}

extension LoginDelegate: UITextFieldDelegate {

}
