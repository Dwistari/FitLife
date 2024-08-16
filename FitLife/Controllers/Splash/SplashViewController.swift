//
//  ViewController.swift
//  FitLife
//
//  Created by Dwistari on 14/08/24.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.onBoarding()
        }
    }
    
    
    private func onBoarding() {
        let vc = WelcomePageController()
        let navController = UINavigationController(rootViewController: vc)
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            // Get the key window from the window scene
            if let window = windowScene.windows.first(where: \.isKeyWindow) {
                window.rootViewController = navController
                window.makeKeyAndVisible()
            }
        }
    }
}

