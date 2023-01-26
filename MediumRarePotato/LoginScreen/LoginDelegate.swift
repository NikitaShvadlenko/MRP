import UIKit
import UIComponents

protocol LoginDelegateProtocol: AnyObject, UITextFieldDelegate, ButtonDelegateProtocol {
    var textFieldEntry: String { get set }
}

class LoginDelegate: NSObject {
    override public init() {
        super.init()
    }
}

extension LoginDelegate: LoginDelegateProtocol {
    var textFieldEntry: String {
        get {
            ""
        }
        set {
            ""
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
