
import Foundation
import UIKit

struct User {
    var nameUser: String
    var avatarUser: UIImage?
    var statusUser: String
}

protocol UserService {
    func userIdentifire (nameUser: String) -> User?
}

class CurrentUserService: UserService {
    
    let user: User? = nil
    
    func userIdentifire(nameUser: String) -> User? {
        if let activUser = user{
            if nameUser == activUser.nameUser {
                return user
            }
        }
        return nil
    }
    
}


class TestUserService: UserService {
    let user = User (
        nameUser: "Трошенков Илья",
        avatarUser: UIImage(named: "avatar"),
        statusUser: "HW #3"
    )
    func userIdentifire(nameUser: String) -> User? {
        if  nameUser == user.nameUser{ return user}
        return nil
            
        }
    }
    

