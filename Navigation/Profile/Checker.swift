

import Foundation


final class Checker{
    static let shared = Checker()
    private let login = "Ilya"
    private let psw = "Qwerty"
    
    private init() {}
    
    func cheker (login:String, psw:String) -> Bool {
        guard login == self.login && psw == self.psw else {return false}
        return true
    }
}

class LoginInspector:LoginViewControllerDelegate{
    func checkerprotocol(login: String, psw: String) -> Bool {
        return Checker.shared.cheker(login: login, psw: psw)
    }
    
}
