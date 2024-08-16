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
    
    lazy var firstNameTf: UITextField = {
        let view = UITextField()
        view.placeholder = "First Name"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lastNameTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Last Name"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var emailTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Email"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pwdTf: UITextField = {
        let view = UITextField()
        view.placeholder = "Password"
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
            firstNameTf.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 16),
            firstNameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            firstNameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 16)
        ])
        
        view.addSubview(lastNameTf)
        NSLayoutConstraint.activate([
            lastNameTf.topAnchor.constraint(equalTo: firstNameTf.bottomAnchor, constant: 16),
            lastNameTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            lastNameTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 16)
        ])
        
        view.addSubview(emailTf)
        NSLayoutConstraint.activate([
            emailTf.topAnchor.constraint(equalTo: lastNameTf.bottomAnchor, constant: 16),
            emailTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            emailTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 16)
        ])
        
        view.addSubview(pwdTf)
        NSLayoutConstraint.activate([
            pwdTf.topAnchor.constraint(equalTo: emailTf.bottomAnchor, constant: 16),
            pwdTf.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            pwdTf.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 16)
        ])
    }
    
}
