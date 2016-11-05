//
//  CareCardModel.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 31/10/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import Foundation
import CareKit

class CareCardModel: NSObject {
    static let sharedCareCardModel = CareCardModel()
    private let sharedCarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
    private override init() {
        
    }
    
    func createCareCard() -> OCKCareCardViewController {
        let careCardViewController = OCKCareCardViewController(carePlanStore: sharedCarePlanStoreManager.store)
        
        careCardViewController.showEdgeIndicators = true
        
        // Setup controller's title and tab bar icon
        careCardViewController.title = "Cuidados"
        careCardViewController.tabBarItem = UITabBarItem(title: "Cuidados", image: UIImage(named: "carecard"), selectedImage: UIImage(named: "carecard-fill"))
        
        careCardViewController.navigationItem.rightBarButtonItem?.title = "Hoje"
        
        careCardViewController.delegate = self
        
//        careCardViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Nova", style: .done, target: self, action: #selector(pushAddActivityController))
        careCardViewController.navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
        return careCardViewController
    }
//
}

extension CareCardModel: OCKCareCardViewControllerDelegate {
    func careCardViewController(_ viewController: OCKCareCardViewController, didSelectButtonWithInterventionEvent interventionEvent: OCKCarePlanEvent) {
        print("teste")
    }
}
