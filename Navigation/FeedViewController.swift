import UIKit

class FeedViewController: UIViewController {
        let post = "Post"
        let stackView: UIStackView
    
        init (){
            stackView = UIStackView()
            super.init(nibName: nil, bundle: nil)
        }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    @objc func tap () {
            let postVc = PostViewController()
            navigationController?.pushViewController(postVc, animated: true)
            postVc.postTitle = post
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .white
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        
        
        let firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.backgroundColor = .systemBlue
        firstButton.layer.cornerRadius = 10
        firstButton.layer.shadowColor = UIColor.black.cgColor
        firstButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        firstButton.layer.shadowOpacity = 1
        firstButton.layer.shadowRadius = 5
        firstButton.setTitle("#1", for: .normal)
        firstButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        stackView.addArrangedSubview(firstButton)
        
        let secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.backgroundColor = .systemRed
        secondButton.layer.cornerRadius = 10
        secondButton.layer.shadowColor = UIColor.black.cgColor
        secondButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        secondButton.layer.shadowOpacity = 1
        secondButton.layer.shadowRadius = 5
        secondButton.setTitle("#2", for: .normal)
        secondButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        stackView.addArrangedSubview(secondButton)
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 5).isActive = true
    }
    
    @objc func showPost(){
        let postVc = PostViewController()
        navigationController?.pushViewController(postVc, animated: true)
    }
}
