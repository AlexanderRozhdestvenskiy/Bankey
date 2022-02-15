//
//  ViewController.swift
//  Bankey
//
//  Created by Alexander Rozhdestvenskiy on 09.01.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleImage = UIImageView()
    let subtitleLabel = UILabel()
    
    let stackView = UIStackView()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    // Animation
    var leadingEdgeOnScreen: CGFloat = 8
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var stackLeadingAnchor: NSLayoutConstraint?

    // LifeCicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.contentMode  = .scaleAspectFit
        titleImage.image = UIImage(named: "imageTitle")
        titleImage.alpha = 0
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.alpha = 0.5
        subtitleLabel.text = "Ваше единственное приложение для всех банковских услуг!"
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Войти", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        stackView.addArrangedSubview(titleImage)
        stackView.addArrangedSubview(subtitleLabel)
        
        view.addSubview(stackView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        stackLeadingAnchor = stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        stackLeadingAnchor?.isActive = true
        
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -16).isActive = true
        
        loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor).isActive = true
        
        errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor).isActive = true
        errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor).isActive = true
        errorMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16).isActive = true
    }
}

extension LoginViewController {
    
    @objc private func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Неправильный логин/пароль")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Неправильный логин/пароль")
        }
        
        if username == "Alex" && password == "Rozh" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        } else {
            configureView(withMessage: "Неправильный логин/пароль")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        snakeButton()
    }
    
    private func snakeButton() {
        let animation = CAKeyframeAnimation()
        
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.84, 1]
        animation.duration = 0.3
        
        animation.isAdditive = true
        signInButton.layer.add(animation, forKey: "snake")
    }
}

// MARK: Animations

extension LoginViewController {
    private func animate() {
        
        let duration = 1.5
        
        let animator1 = UIViewPropertyAnimator(duration: duration, curve: .easeInOut) {
            self.stackLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        animator1.startAnimation()
        
        let animator2 = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut) {
            self.titleImage.alpha = 1
            self.subtitleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        animator2.startAnimation(afterDelay: 2.0)
    }
}
