
import UIKit

class ProfileViewController: UIViewController {
    
    let header = ProfileHeaderView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(header)
        header.addProfileViews()
        view.backgroundColor = .lightGray
        
        
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



