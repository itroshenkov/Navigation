

import Foundation

protocol LoginFactory {
    func loginFactory() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    
    static let shared = MyLoginFactory()

    func loginFactory () -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
}
