//
//  InsightViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 24/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class InsightViewController: UINavigationController {
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private static var insightsViewController: OCKInsightsViewController! = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        storeManager.delegate = self
        print("Insight")
        if InsightViewController.insightsViewController == nil {
            InsightViewController.insightsViewController = createInsightsViewController()
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        if InsightViewController.insightsViewController == nil {
            InsightViewController.insightsViewController = createInsightsViewController()
            
        }
        
        self.pushViewController(InsightViewController.insightsViewController, animated: false)
    }
    
    private func createInsightsViewController() -> OCKInsightsViewController {
        // Create an `OCKInsightsViewController` with sample data.
        let headerTitle = NSLocalizedString("Gráficos Semanais", comment: "")
        let viewController = OCKInsightsViewController(insightItems: storeManager.insights, headerTitle: headerTitle, headerSubtitle: "")
        
        // Setup the controller's title and tab bar item
        viewController.title = NSLocalizedString("Insights", comment: "")
        viewController.tabBarItem = UITabBarItem(title: viewController.title, image: UIImage(named:"insights"), selectedImage: UIImage(named: "insights-filled"))
        
        return viewController
    }
}

extension InsightViewController: CarePlanStoreManagerDelegate {
    
    /// Called when the `CarePlanStoreManager`'s insights are updated.
    func carePlanStoreManager(manager: CarePlanStoreManager, didUpdateInsights insights: [OCKInsightItem]) {
        // Update the insights view controller with the new insights.
        InsightViewController.insightsViewController.items = insights
    }
}
