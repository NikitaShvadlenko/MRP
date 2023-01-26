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

extension LoginDelegate: LoginDelegateProtocol {
    var textFieldEntry: String {
        get {
            "Lalalal"
        }
        set {
            textFieldEntry = newValue
        }
    }
}

extension LoginDelegate: UITextFieldDelegate {

}

extension LoginDelegate: ButtonDelegateProtocol {
    func buttonPressed() {
        print("Button Pressed")
    }
}
