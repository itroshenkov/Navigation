//import UIKit
//
//class ProfileViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .lightGray
//
//        let profileHeaderView = ProfileHeaderView()
//                self.view.addSubview(profileHeaderView)
//            }
//    override func viewWillLayoutSubviews() {
//            self.view.subviews.first?.frame = self.view.frame
//
//        }
//}



import UIKit

class ProfileViewController: UIViewController {
    
    let header = ProfileHeaderView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(header)
        header.addProfileViews()
        view.backgroundColor = .lightGray
        self.hideKeyboardWhenTappedAround()
        
    }
    
    override func viewWillLayoutSubviews() {
        
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            header.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            header.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
