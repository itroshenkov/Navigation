//
//  Model.swift
//  Navigation
//
//  Created by itroshenkov on 30.05.2022.
//

import Foundation
final class Model {
    
    let password = "Пароль"
    
    func check(word: String) {
        guard word != "" else { return }
        if word == password {
            NotificationCenter.default.post(name: NSNotification.Name.codeGreen, object: nil)
        } else {
            NotificationCenter.default.post(name: NSNotification.Name.codeRed, object: nil)
        }
    }
}
