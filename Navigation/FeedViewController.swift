import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.setTitle("Post", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
        button.backgroundColor = .blue
        
        struct Post {
            var tit: String
        }
    }
    
    @objc func tap(){
        let postVc = PostViewController()
        navigationController?.pushViewController(postVc, animated: true)
    }
}
