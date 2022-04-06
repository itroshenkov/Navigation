
import UIKit



class ProfileHeaderView: UITableViewHeaderFooterView {
    
    static let identifire = "ProfileHeaderView"
    
    var status: String = ""
    
   lazy var avatar: UIImageView = {
        let avatar = UIImageView()
        avatar.autoLayoutOn()
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "avatar")
        avatar.layer.cornerRadius = 50
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.openAnimationAvatar))
        avatar.addGestureRecognizer(recognizer)
        avatar.isUserInteractionEnabled = true
        return avatar
    }()
    
    private var startAvatarPosicion: CGPoint?
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.autoLayoutOn()
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    var closeAvatarButton: UIButton = {
        let closeButton = UIButton()
        closeButton.isHidden = true
        closeButton.autoLayoutOn()
        closeButton.imageView?.contentMode = .scaleAspectFit
        closeButton.backgroundColor = .darkGray
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeAnimationAvatar), for: .touchUpInside)
        return closeButton
    }()
    
    var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.autoLayoutOn()
        nameLabel.text = "Ilya Troshenkov"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return nameLabel
    }()
    
    var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.autoLayoutOn()
        statusLabel.text = "Waiting for something..."
        statusLabel.numberOfLines = 2
        statusLabel.textColor = .darkGray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return statusLabel
    }()
    
    var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.autoLayoutOn()
        statusTextField.layer.cornerRadius = 12
        statusTextField.clipsToBounds = true
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.backgroundColor = .white
        
        statusTextField.placeholder = "Enter your status..."
        
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .center
        
        statusTextField.autocorrectionType = UITextAutocorrectionType.no
        statusTextField.keyboardType = UIKeyboardType.default
        statusTextField.returnKeyType = UIReturnKeyType.done
        statusTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        statusTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        statusTextField.isEnabled = true
        statusTextField.isUserInteractionEnabled = true
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()
    
    
    var showStatusButton: UIButton = {
        let button = UIButton()
        
        button.autoLayoutOn()
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = .blue
        
        button.layer.cornerRadius = 4
        
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4.0
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonPressed(sender: UIButton!) {
        print(statusTextField.text ?? "---")
        guard statusTextField.text?.isEmpty == false else {return}
        
        statusLabel.text = statusTextChanged(statusTextField)
        self.statusTextField.text = ""
    }
    
    
    @objc func statusTextChanged(_ textField: UITextField) -> String {
        if let newStatus = textField.text {
            status = newStatus
        }
        return status
    }
    
    @objc func openAnimationAvatar() {
        UIImageView.animate(
            withDuration: 0.5,
            animations: {
                self.startAvatarPosicion = self.avatar.center
                self.avatar.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                self.avatar.transform = CGAffineTransform(scaleX: self.contentView.frame.width / self.avatar.frame.width,
                                                          y: self.contentView.frame.width / self.avatar.frame.width)
                self.avatar.layer.cornerRadius = 0
                self.backView.isHidden = false
                self.backView.alpha = 0.7
                self.avatar.isUserInteractionEnabled = false
                ProfileViewController.postTable.isScrollEnabled = false
            },
            completion: { _ in
                UIImageView.animate(withDuration: 0.3) {
                    self.closeAvatarButton.isHidden = false
                    self.closeAvatarButton.alpha = 1
                }
            })
    }
    
    
    @objc func closeAnimationAvatar() {
            UIImageView.animate(
                withDuration: 0.3,
                animations: {
                    self.closeAvatarButton.alpha = 0
                    self.closeAvatarButton.isHidden = true
                    
                },
                completion: { _ in
                    UIImageView.animate(withDuration: 0.5,
                                        animations: {
                        self.avatar.transform = CGAffineTransform(scaleX: 1, y: 1)
                        self.avatar.layer.cornerRadius = self.avatar.frame.width / 2
                        self.avatar.center = self.startAvatarPosicion!
                        self.backView.alpha = 0.0
                        self.avatar.isUserInteractionEnabled = true
                        ProfileViewController.postTable.isScrollEnabled = true
                    },
                                        completion: { _ in
                        self.backView.isHidden = true
                    })
                })
            
        }
    
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(nameLabel,showStatusButton,statusLabel,statusTextField, backView, closeAvatarButton, avatar)
        setupConstraints()
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            
            nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            nameLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            
            showStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            showStatusButton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            statusTextField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -12),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            statusLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -12),
            statusLabel.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16)
        ])
    }
    
}
