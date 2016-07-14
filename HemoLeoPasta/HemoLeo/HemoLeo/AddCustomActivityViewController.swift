//
//  AddCustomActivityViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/14/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class AddCustomActivityViewController: UIViewController {
    
    @IBOutlet weak var activityNameTextField: UITextField!
    @IBOutlet weak var activitySubtitleTextField: UITextField!
    @IBOutlet weak var activityInstructionsTextField: UITextField!
    @IBOutlet weak var activityOccurrencesTextField: UITextField!
    
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    
    var startDay: Int = Int()
    var startMonth: Int = Int()
    var startYear: Int = Int()
    var dateComponents: NSDateComponents?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func datePicker(datePicker: UIDatePicker) {
        let chosenDate = datePicker.date
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        self.dateComponents = calendar?.components([.Weekday, .Year], fromDate: chosenDate)
        
        self.startDay = (dateComponents?.day)!
        self.startMonth = (dateComponents?.month)!
        self.startYear = (dateComponents?.year)!
    }
    
    @IBAction func saveCustomActivity(sender: AnyObject) {
        
        let schedule = OCKCareSchedule.weeklyScheduleWithStartDate(self.dateComponents!, occurrencesOnEachDay: [1, 1, 1, 1, 1, 1, 1])
        
        let activity = OCKCarePlanActivity.interventionWithIdentifier(self.activityNameTextField.text!,
                                                                      groupIdentifier: nil,
                                                                      title: self.activityNameTextField.text!,
                                                                      text: self.activitySubtitleTextField.text!,
                                                                      tintColor: UIColor.blackColor(),
                                                                      instructions: self.activityInstructionsTextField.text!,
                                                                      imageURL: nil,
                                                                      schedule: schedule,
                                                                      userInfo: nil)
        
        self.storeManager.store.addActivity(activity) { (success, error) in
            if error == nil {
                print("Successfully saved custom activity")
            } else {
                print("Error saving custom activity: \(error?.localizedDescription)")
            }
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func backToAddActivities(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
}
