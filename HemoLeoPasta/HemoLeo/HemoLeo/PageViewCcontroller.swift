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
        return [self.getViewController(name: "story1"),
                self.getViewController(name: "story2"),
                self.getViewController(name: "story3"),
            self.getViewController(name: "story4") ,
            self.getViewController(name: "story5")]
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
            if (view as AnyObject).isKind(UIScrollView) {
                scrollView = view as? UIScrollView
            }
            else if (view as AnyObject).isKind(UIPageControl.self) {
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
extension PageViewCcontroller: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
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
    
    override func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
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
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
                  let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
