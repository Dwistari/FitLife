//
//  OnBoardingController.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit

class OnBoardingController: UIViewController {
    
    lazy var imageContent: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subTitleLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextBtn: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "ic_arrow"), for: .normal)
        view.backgroundColor = UIColor(hex: "#9DCEFF")
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(gotoRegister), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var arrayTitle: [String] = []
    var arraySubTitle: [String] = []
    var arrayImage: [String] = []
    var pageIndex: Int = 0

    var nextButtonTapped: (() -> Void)?

    private let onboardingContent = [
        ("onBoard_1", "Track Your Goal", "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals"),
        ("onBoard_2", "Get Burn", "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever."),
        ("onBoard_3", "Eat Well", "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun."),
        ("onBoard_4", "Improve Sleep  Quality", "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setContent()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(imageContent)
        NSLayoutConstraint.activate([
            imageContent.topAnchor.constraint(equalTo: view.topAnchor),
            imageContent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageContent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageContent.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        view.addSubview(titleLbl)
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: imageContent.bottomAnchor, constant: 50),
            titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        view.addSubview(subTitleLbl)
        NSLayoutConstraint.activate([
            subTitleLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 16),
            subTitleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subTitleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        view.addSubview(nextBtn)
        NSLayoutConstraint.activate([
            nextBtn.heightAnchor.constraint(equalToConstant: 60),
            nextBtn.widthAnchor.constraint(equalToConstant: 60),
            nextBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
    }
    
    
    func setContent() {
        let content = onboardingContent[pageIndex]
        imageContent.image = UIImage(named: content.0)
        titleLbl.text = content.1
        subTitleLbl.text = content.2
    }
    
    
    @objc private func gotoRegister() {
        nextButtonTapped?()
    }
}
