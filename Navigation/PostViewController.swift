import UIKit

class PostViewController: UIViewController {
    
    var postTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = postTitle
        view.backgroundColor = .green
        
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tap1))
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func tap1(){
        let infoVc = InfoViewController()
        self.present(infoVc, animated: true, completion: nil)
    }
    
}
