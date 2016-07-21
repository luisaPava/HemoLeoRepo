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
        self.view.frame = CGRectMake(0, 0, 1024, 768)
        self.delegate = SymptomCardViewController()
//        self.stepViewController
        self.view.alignmentRectInsets()

        // Do any additional setup after loading the view.
    }
    
//    override func viewWillAppear(animated: Bool) {
//        let taskViewController = ORKTaskViewController(task: task, restorationData: nil, delegate: SymptomCardViewController())
//        
//        self.presentViewController(taskViewController, animated: true, completion: nil)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
