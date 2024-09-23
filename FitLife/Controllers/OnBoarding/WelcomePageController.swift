//
//  WelcomePageController.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit
import SwiftUI

class WelcomePageController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView(frame: self.view.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoImg: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_onboard")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var getStartedBtn: UIButton = {
        let view = UIButton()
        view.setTitle("Get Started", for: .normal)
        view.setTitleColor(UIColor(hex: "#9DCEFF"), for: .normal)
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 30
        view.addTarget(self, action: #selector(openListWorkout), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    
    private func setupView() {
        containerView.applyGradient()
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        containerView.addSubview(logoImg)
        NSLayoutConstraint.activate([
            logoImg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            logoImg.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
        
        
        containerView.addSubview(getStartedBtn)
        NSLayoutConstraint.activate([
            getStartedBtn.heightAnchor.constraint(equalToConstant: 60),
            getStartedBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 16),
            getStartedBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16),
            getStartedBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    @objc private func gotoOnboarding() {
        let vc = OnboardingPageViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func openListWorkout() {
        let swiftUIView = WorkoutHistoryView()
        
        // Create a UIHostingController with the SwiftUI view
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        // Add the hosting controller as a child view controller
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // Set the frame of the hosting controller's view to fill the parent view
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify the hosting controller that it has been moved to a parent view controller
        hostingController.didMove(toParent: self)
    }
}
