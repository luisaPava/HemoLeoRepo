//
//  TutorialPageViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class TutorialPageViewController: UIPageViewController {
    
    // Set an array with the view controllers to be shown
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.getViewController(name: "tutorial0"),
                self.getViewController(name: "tutorial1"),
                self.getViewController(name: "tutorial2"),
                self.getViewController(name: "tutorial3"),
                self.getViewController(name: "tutorial4"),
                self.getViewController(name: "tutorial5"),
                self.getViewController(name: "tutorial6"),
                self.getViewController(name: "tutorial7")]
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        // Load the first view controller
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .reverse,
                               animated: true,
                               completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Return the view controller with the identifier received
    private func getViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    // Change the page control background color
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let subViews: NSArray = view.subviews as NSArray
        var scrollView: UIScrollView? = nil
        var pageControl: UIPageControl? = nil
        
        for view in subViews {
            if view is UIScrollView {
                scrollView = view as? UIScrollView
            }
            else if view is UIPageControl {
                pageControl = view as? UIPageControl
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            scrollView?.frame = view.bounds
            view.bringSubview(toFront: pageControl!)
        }
    }
}


//MARK: - UIPageViewControllerDataSource
extension TutorialPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
            
        let previousIndex = viewControllerIndex - 1
            
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
    
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let viewControllersCount = orderedViewControllers.count
        
        guard viewControllersCount != nextIndex else {
            return nil
        }
        
        guard viewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
        let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
    
    
}

