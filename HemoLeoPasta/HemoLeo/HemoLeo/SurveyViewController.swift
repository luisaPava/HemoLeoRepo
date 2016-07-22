//
//  SurveyViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 20/07/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import ResearchKit

class SurveyViewController: ORKTaskViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        self.delegate = SymptomCardViewController()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(-100, -50, 600, 700)
        self.view.autoresizesSubviews = false
    }
}
