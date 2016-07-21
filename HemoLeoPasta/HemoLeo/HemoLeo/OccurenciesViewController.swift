//
//  OccurenciesViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/19/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class OccurenciesViewController: UIViewController {
    var tableView: UITableView!
    var activity: Int!
    var activities: Array<Bool> = []
    var instanceOfActivity: OCKCarePlanActivity!
    var button: UIButton!
    var arrayDias: Array<String>!
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activities = codingManager.loadToAddActivitiesData()!
        
        arrayDias = ["     Segunda-feira", "     Terça-feira", "     Quarta-feira", "     Quinta-feira", "     Sexta-feira", "     Sábado", "     Domingo"]
        
        print(self.view.frame.width)
        
        tableView = UITableView(frame: CGRectMake(0, 100, 400, 340), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "CustomActivityCell", bundle: nil), forCellReuseIdentifier: "CustomActivityCell")
//        tableView.separatorStyle = .None
//        tableView.contentInset = UIEdgeInsetsMake(-36, 0, -36, -36)
        tableView.clipsToBounds = true

        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 7
        
        self.view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func valueChanged(sender: AnyObject) {
        
        valueLabel.text = Int(stepper.value).description
        
    }
    
    @IBAction func save(sender: AnyObject) {
        
        let st = Int(stepper.value)
        
        switch activity {
        case 3:
            instanceOfActivity = Exercise().carePlanActivityCustom([st, st, st, st, st, st, st])
            
        case 4:
            instanceOfActivity = Fisiotherapy().carePlanActivityCustom([st, st, st, st, st, st, st])
            
        case 5:
            instanceOfActivity = Shot().carePlanActivityCustom([st, st, st, st, st, st, st])
        default:
            break
        }
        
        if let activity = activity {
            self.storeManager.store.addActivity(instanceOfActivity) { (success, error) in
                if (error != nil) {
                    print("An error occurred when adding a new Activity: \(error?.debugDescription)")
                }
            }
            
            self.activities[activity] = true

            
            // Saves the 'to add' activity to 'addedActivities' coding and array.
            self.codingManager.saveAddedActivitiesData(activities)
            
            // Removes the selected 'to add' activity from its coding and array.
            self.codingManager.saveToAddActivitiesData(activities)
            print(button)
            button.selected = true
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}

//MARK: - Table View Delegate
extension OccurenciesViewController: UITableViewDelegate {
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        <#code#>
//    }

}

//MARK: - Table View Data Source
extension OccurenciesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomActivityCell", forIndexPath: indexPath) as! CustomActivityCell
        cell.labelNome.text = arrayDias[indexPath.row]
        print(indexPath.row)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDias.count
        
    }
}
