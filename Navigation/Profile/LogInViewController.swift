
import UIKit


class LogInViewController: UIViewController, UITextFieldDelegate{
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
    
    var logInButton: UIButton = {
        let button = UIButton()
        button.autoLayoutOn()
        button.setTitle("Вход", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
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
        stackView.clipsToBounds = true
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.navigationController?.navigationBar.isHidden = true
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: max(view.frame.width, view.frame.height))
        contentView.addSubviews(logoVK, stackView, logInButton)
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(password)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        setupConstraints()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)
        notificationCenter.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
        self.scrollView.keyboardDismissMode = .onDrag
        
        
//#if release
//        userName.text = ""
//#elseif DEBUG
//        userName.text = "Трошенков Илья"
//#endif
        
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
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    @objc func tap() {
        password.resignFirstResponder()
        userName.resignFirstResponder()
    }
    
    @objc func login() {
        
        var userService: UserService
        
#if release
        userService = CurrentUserService()
#elseif DEBUG
        userService = TestUserService()
#endif
        let profileViewController = ProfileViewController(userService: userService, nameUser: userName.text ?? "")
        navigationController?.setViewControllers([profileViewController], animated: true)
    }
    
    //            navigationController?.pushViewController(ProfileViewController(), animated: true)
}


