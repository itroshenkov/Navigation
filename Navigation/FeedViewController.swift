import UIKit
import StorageService

class FeedViewController: UIViewController {
    private var model = Model()
    let post = "Post"
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.autoLayoutOn()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.autoLayoutOn()
        return stackView
    }()
    
    var stackViewCheck: UIStackView = {
        let stackView = UIStackView()
        stackView.autoLayoutOn()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.autoLayoutOn()
        return stackView
    }()
    
    
    var firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.backgroundColor = .systemBlue
        firstButton.layer.cornerRadius = 10
        firstButton.layer.shadowColor = UIColor.black.cgColor
        firstButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        firstButton.layer.shadowOpacity = 1
        firstButton.layer.shadowRadius = 5
        firstButton.setTitle("#1", for: .normal)
        firstButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        firstButton.autoLayoutOn()
        return firstButton
    }()
    
    var secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.backgroundColor = .systemRed
        secondButton.layer.cornerRadius = 10
        secondButton.layer.shadowColor = UIColor.black.cgColor
        secondButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        secondButton.layer.shadowOpacity = 1
        secondButton.layer.shadowRadius = 5
        secondButton.setTitle("#2", for: .normal)
        secondButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        secondButton.autoLayoutOn()
        return secondButton
    }()
    
    var buttonModel: CustomButton = {
        let button = CustomButton(
            title: "Проверка пароля",
            titleColor: .green,
            backColor: .black,
            backImage: UIImage()
        )
        return button
    }()
    
    var textFieldModel: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.clipsToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.backgroundColor = .gray
        textField.placeholder = "введите слово..."
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return textField
    }()
    
    var labelModel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .center
        label.backgroundColor = .systemGray6
        label.autoLayoutOn()
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubviews(stackView,stackViewCheck, buttonModel, textFieldModel, labelModel)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackViewCheck.addArrangedSubview(labelModel)
        stackViewCheck.addArrangedSubview(textFieldModel)
        stackViewCheck.addArrangedSubview(buttonModel)
        setupConstraints()
        
        buttonModel.tapAction = { [weak self] in
            guard let self = self else { return }
            self.buttonModelAction()
        }
        
        title = "Feed"
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(redText),
            name: NSNotification.Name.codeRed,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(greenText),
            name: NSNotification.Name.codeGreen,
            object: nil
        )
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 5),
            
            stackViewCheck.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackViewCheck.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackViewCheck.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackViewCheck.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc func redText() {
        labelModel.text = "красный текст"
        labelModel.textColor = .red
    }
    
    @objc func greenText() {
        labelModel.text = "зеленый текст"
        labelModel.textColor = .green
    }
    
    private func buttonModelAction() {
        model.check(word: textFieldModel.text!)
    }
    
    
    @objc func showPost(){
        let postVc = PostViewController()
        navigationController?.pushViewController(postVc, animated: true)
    }
    
    @objc func tap () {
        let postVc = PostViewController()
        navigationController?.pushViewController(postVc, animated: true)
        postVc.postTitle = post
    }
    
}
