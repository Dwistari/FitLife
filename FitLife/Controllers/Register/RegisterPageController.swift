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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(heyLbl)
        NSLayoutConstraint.activate([
            heyLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heyLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        view.addSubview(titleLbl)
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: heyLbl.bottomAnchor),
            titleLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
}
