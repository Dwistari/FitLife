//
//  RegisterPageController.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit

class RegisterPageController: UIViewController {
    
    lazy var heyLbl: UILabel = {
        let label = UILabel()
        label.text = "Hey there"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.text = "Create an Account"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var firstNameTf: CostumTextField = {
        let view = CostumTextField()
        view.placeholder = "First Name"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lastNameTf: CostumTextField = {
        let view = CostumTextField()
        view.placeholder = "Last Name"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var emailTf: CostumTextField = {
        let view = CostumTextField()
        view.placeholder = "Email"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pwdTf: CostumTextField = {
        let view = CostumTextField()
        view.placeholder = "Password"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var checkBox: CheckBox = {
        let view = CheckBox()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tncLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = "By continuing you accept our Privacy Policy and Term of Use"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginLbl: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = "Already have an account? Login"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginBtn: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerBtn: UIButton = {
        let view = UIButton()
        view.setTitle("Register", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(hex: "#9DCEFF")
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(heyLbl)
        NSLayoutConstraint.activate([
            heyLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            heyLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(titleLbl)
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: heyLbl.bottomAnchor, constant: 16),
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(firstNameTf)
        NSLayoutConstraint.activate([
            firstNameTf.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 32),
            firstNameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            firstNameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        
        view.addSubview(lastNameTf)
        NSLayoutConstraint.activate([
            lastNameTf.topAnchor.constraint(equalTo: firstNameTf.bottomAnchor, constant: 16),
            lastNameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            lastNameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        
        view.addSubview(emailTf)
        NSLayoutConstraint.activate([
            emailTf.topAnchor.constraint(equalTo: lastNameTf.bottomAnchor, constant: 16),
            emailTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            emailTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        
        view.addSubview(pwdTf)
        NSLayoutConstraint.activate([
            pwdTf.topAnchor.constraint(equalTo: emailTf.bottomAnchor, constant: 16),
            pwdTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            pwdTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        
        view.addSubview(checkBox)
        NSLayoutConstraint.activate([
            checkBox.topAnchor.constraint(equalTo: pwdTf.bottomAnchor, constant: 16),
            checkBox.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
        ])
        
        view.addSubview(tncLabel)
        NSLayoutConstraint.activate([
            tncLabel.topAnchor.constraint(equalTo: pwdTf.bottomAnchor, constant: 16),
            tncLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor,constant: 16),
            tncLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        
        
        view.addSubview(loginLbl)
        NSLayoutConstraint.activate([
            loginLbl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            loginLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(loginBtn)
        NSLayoutConstraint.activate([
            loginBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            loginBtn.leadingAnchor.constraint(equalTo: loginLbl.trailingAnchor)
        ])
        
        view.addSubview(registerBtn)
        NSLayoutConstraint.activate([
            registerBtn.heightAnchor.constraint(equalToConstant: 60),
            registerBtn.bottomAnchor.constraint(equalTo: loginLbl.topAnchor, constant: -16),
            registerBtn.leadingAnchor.constraint(equalTo: checkBox.leadingAnchor,constant: 16),
            registerBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
        ])
        
    }
    
    @objc private func register() {
        let vc = OnboardingPageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
