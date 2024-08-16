//
//  OnBoardingPageViewController.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit

class OnboardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private let onboardingContentCount = 4
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        if let firstViewController = viewControllerForPageIndex(0) {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func viewControllerForPageIndex(_ index: Int) -> OnBoardingController? {
        guard index >= 0 && index < onboardingContentCount else { return nil }
        
        let onboardingController = OnBoardingController()
        onboardingController.pageIndex = index
        onboardingController.setContent()

        onboardingController.nextButtonTapped = { [weak self] in
            self?.swipeNextPage(from: index)
        }
        
        return onboardingController
    }
    
    
    private func swipeNextPage(from index: Int) {
        let nextIndex = index + 1
        if let nextViewController = viewControllerForPageIndex(nextIndex) {
            currentIndex = nextIndex
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
        
        if nextIndex == onboardingContentCount {
            let vc = RegisterPageController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {}
}
