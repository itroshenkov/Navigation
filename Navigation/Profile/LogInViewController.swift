
import UIKit

protocol LoginViewControllerDelegate {
    func checkerprotocol (login: String, psw: String) -> Bool
}

class LogInViewController: UIViewController, UITextFieldDelegate{
    
    private var isLogin = false
    
    var delegate: LoginViewControllerDelegate!
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.autoLayoutOn()
        return scrollView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.autoLayoutOn()
        return contentView
    }()
    
    var logoVK: UIImageView = {
        let logoVK = UIImageView()
        logoVK.image = UIImage(named: "Logo")
        logoVK.autoLayoutOn()
        logoVK.contentMode = .scaleAspectFit
        return logoVK
    }()
    
    var userName: UITextField = {
        let userName = UITextField()
        userName.autoLayoutOn()
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userName.tintColor = UIColor(named: "AccentColor")
        userName.layer.borderColor = UIColor.lightGray.cgColor
        userName.layer.borderWidth = 0.5
        userName.placeholder = "Почта или телефон"
        userName.keyboardType = .emailAddress
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height:userName.frame.height))
        userName.leftViewMode = .always
        userName.returnKeyType = .done
        return userName
    }()
    
    var password: UITextField = {
        let password = UITextField()
        password.autoLayoutOn()
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.tintColor = UIColor(named: "AccentColor")
        password.autocapitalizationType = .none
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.isSecureTextEntry = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.placeholder = "Пароль"
        password.returnKeyType = UIReturnKeyType.default
        return password
    }()
    
    var logInButton: CustomButton = {
        let button = CustomButton (
            title: "Log in",
            titleColor: UIColor.white,
            backColor: UIColor.white,
            backImage: UIImage(named: "blue_pixel") ?? UIImage()
        )
        button.autoLayoutOn()
        return button
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.autoLayoutOn()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.systemGray6.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = false
        return stackView
    }()
    
    var hackButton: CustomButton = {
        let button = CustomButton(
            title: "Подбор пароля",
            titleColor: UIColor.white,
            backColor: UIColor.white,
            backImage: UIImage(named: "blue_pixel") ?? UIImage()
        )
        button.autoLayoutOn()
        return button
    }()
    
    var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.autoLayoutOn()
        return indicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.isHidden = true
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: max(view.frame.width, view.frame.height))
        contentView.addSubviews(logoVK, stackView, logInButton, hackButton, indicator)
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(password)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        setupConstraints()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)
        notificationCenter.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
        self.scrollView.keyboardDismissMode = .onDrag
        
        logInButton.tapAction = { [weak self] in
            guard let self = self else { return }
            self.buttonPressed()
        }
        
        hackButton.tapAction = { [weak self] in
            guard let self = self else { return }
            self.hackPassword()
        }
        
    }
    
    @objc
    private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardFrame.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        }
    }
    
    @objc
    func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leading),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailing),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: Const.indent),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: Const.leading),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            hackButton.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 15),
            hackButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hackButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            hackButton.heightAnchor.constraint(equalToConstant: 25),
            
            indicator.topAnchor.constraint(equalTo: hackButton.bottomAnchor, constant: 5),
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    @objc func tap() {
        password.resignFirstResponder()
        userName.resignFirstResponder()
    }
    
    private func buttonPressed() {
        
        //        #if DEBUG
        let currentUserService = TestUserService()
        //        #else
        //        let currentUserService = CurrentUserService()
        //        #endif
        let profileVC = ProfileViewController(userService: currentUserService, name: userName.text!)
        
        if delegate?.checkerprotocol(login: userName.text!, psw: password.text!) == true {
            isLogin = true
            navigationController?.pushViewController(profileVC, animated: true)
            navigationController?.setViewControllers([profileVC], animated: true)
        } else {
            print ("Ошибка авторизации")
            
        }
    }
    
    private func hackPassword() {
        let hack = BrutForce()
        var psw: String = ""
        
        password.placeholder = "hacking..."
        indicator.isHidden = false
        indicator.startAnimating()
        DispatchQueue.global().async {
            psw = hack.bruteForce(passwordToUnlock: "1234")
            
            DispatchQueue.main.sync {
                self.password.text = psw
                self.password.isSecureTextEntry = false
                self.password.placeholder = "Пароль"
                self.indicator.stopAnimating()
            }
        }
    }
}

