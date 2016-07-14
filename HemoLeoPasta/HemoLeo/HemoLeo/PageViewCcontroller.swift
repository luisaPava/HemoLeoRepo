//
//  PageViewCcontroller.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 13/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class PageViewCcontroller: UIPageViewController {
    
    // Set an array with the view controllers to be shown
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.getViewController("main"),
                self.getViewController("canvas")]
    }()

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        // Load the first view controller
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                                direction: .Reverse,
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
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(name)
    }
    
    // Change the page control background color
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let subViews: NSArray = view.subviews
        var scrollView: UIScrollView? = nil
        var pageControl: UIPageControl? = nil
        
        for view in subViews {
            if view.isKindOfClass(UIScrollView) {
                scrollView = view as? UIScrollView
            }
            else if view.isKindOfClass(UIPageControl) {
                pageControl = view as? UIPageControl
            }
        }
        
        if (scrollView != nil && pageControl != nil) {
            scrollView?.frame = view.bounds
            view.bringSubviewToFront(pageControl!)
        }
    }
}


//MARK: - UIPageViewControllerDataSource
extension PageViewCcontroller: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        //User is in the first page page and swiped to the left, go to the last page
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let viewControllersCount = orderedViewControllers.count
        
        //User is in the last page page and swiped to the right, go to the first page
        guard viewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard viewControllersCount > nextIndex else {
            return nil
        }
        
        return nil
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
                  firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
