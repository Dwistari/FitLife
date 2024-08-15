//
//  OnBoardingPageViewController.swift
//  FitLife
//
//  Created by Dwistari on 15/08/24.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private let onboardingContentCount = 4
    
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
        
        let onBoardingController = OnBoardingController()
        onBoardingController.pageIndex = index
        onBoardingController.setContent()
        
        return onBoardingController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentViewController = viewController as? OnBoardingController else {
            return nil
        }
        let currentIndex = currentViewController.pageIndex
        return viewControllerForPageIndex(currentIndex - 1)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentViewController = viewController as? OnBoardingController else {
            return nil
        }
        let currentIndex = currentViewController.pageIndex
        return viewControllerForPageIndex(currentIndex + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if completed, _ = viewControllers?.first as? OnBoardingController {
//              // Optionally handle the completion of the page transition
//          }
      }
}
