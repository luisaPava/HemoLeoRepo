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
    var cellDescriptor: Array<cells>! = []
    var visibleCell: Array<cells>! = []
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activities = codingManager.loadToAddActivitiesData()!

        let cellSlider = cells(additionalRows: 0, cellIdentifier: "idCellSlider", isExpandable: false, isExpanded: false, isVisible: false, primaryTitle: "", secondaryTitle: "", value: "")
        
        
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Segunda-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Terça-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Quarta-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Quinta-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Sexta-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Sábado", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "     Domingo", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        
        print(self.view.frame.width)
        
        tableView = UITableView(frame: CGRectMake(0, 100, 400, 340), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(UINib(nibName: "CustomActivityCell", bundle: nil), forCellReuseIdentifier: "idCellNormal")
        tableView.registerNib(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "idCellSlider")
        tableView.clipsToBounds = true

        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 7
        
        self.view.addSubview(tableView)
        
        getVisibleCells()
        
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
    
    func getVisibleCells() {
        visibleCell.removeAll()
        print(visibleCell)
        
        for cell in cellDescriptor {
            if cell.isVisible {
                visibleCell.append(cell)
            }
        }
    }
}

//MARK: - Table View Delegate
extension OccurenciesViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if visibleCell[indexPath.row].isExpandable {
            if !cellDescriptor[indexPath.row + 1].isExpanded {
                cellDescriptor[indexPath.row + 1].isVisible = true
                cellDescriptor[indexPath.row + 1].isExpanded = true
                getVisibleCells()
                tableView.reloadData()
                
            } else if cellDescriptor[indexPath.row + 1].isExpanded {
                cellDescriptor[indexPath.row + 1].isVisible = false
                cellDescriptor[indexPath.row + 1].isExpanded = false
                getVisibleCells()
                tableView.reloadData()
            }
        }
    }
}

//MARK: - Table View Data Source
extension OccurenciesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CustomActivityCell
        
//        if (indexPath.row % 2) == 0 {
//            cell = tableView.dequeueReusableCellWithIdentifier("idCellNormal", forIndexPath: indexPath) as! CustomActivityCell
//            
//            cell.labelNome.text = arrayDias[indexPath.row / 2]
//        } else {
//            cell = tableView.dequeueReusableCellWithIdentifier("idCellSlider", forIndexPath: indexPath) as! CustomActivityCell
//            
//            cell.slExperienceLevel.value = 0.0
//        }
        
        if visibleCell[indexPath.row].cellIdentifier == "idCellNormal" {
            cell = tableView.dequeueReusableCellWithIdentifier("idCellNormal", forIndexPath: indexPath) as! CustomActivityCell
            
            cell.labelNome.text = visibleCell[indexPath.row].primaryTitle
            
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("idCellSlider", forIndexPath: indexPath) as! CustomActivityCell
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleCell.count
        
    }
}
