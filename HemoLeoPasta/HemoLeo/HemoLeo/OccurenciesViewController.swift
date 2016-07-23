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
    var occurences: [Int] = [0, 0, 0, 0, 0, 0, 0]
    var currentCell: String = ""
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activities = codingManager.loadToAddActivitiesData()!

        let cellSlider = cells(additionalRows: 0, cellIdentifier: "idCellSlider", isExpandable: false, isExpanded: false, isVisible: false, primaryTitle: "", secondaryTitle: "", value: "0")
        
        
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Segunda-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Terça-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Quarta-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Quinta-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Sexta-feira", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Sábado", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        cellDescriptor.append(cells(additionalRows: 1, cellIdentifier: "idCellNormal", isExpandable: true, isExpanded: true, isVisible: true, primaryTitle: "Domingo", secondaryTitle: "", value: ""))
        cellDescriptor.append(cellSlider)
        
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
        
//        let st = Int(stepper.value)
        
        switch activity {
        case 3:
            instanceOfActivity = Exercise().carePlanActivityCustom(occurences)
            
        case 4:
            instanceOfActivity = Fisiotherapy().carePlanActivityCustom(occurences)
            
        case 5:
            instanceOfActivity = Shot().carePlanActivityCustom(occurences)
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
//            print(button)
//            button.selected = true
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}

//MARK: - Table View Delegate
extension OccurenciesViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cellName = visibleCell[indexPath.row].primaryTitle
        let indexCellDescriptor = getIndexDescriptor(cellName)
//        var cell =
        
        if visibleCell[indexPath.row].isExpandable {
//            var expansionCell = cellDescriptor[indexCellDescriptor + 1]
            
            if !cellDescriptor[indexCellDescriptor + 1].isExpanded {
                visibleCell[indexPath.row].buttonHidden = false
                cellDescriptor[indexCellDescriptor + 1].isVisible = true
                cellDescriptor[indexCellDescriptor + 1].isExpanded = true
                getVisibleCells()
                tableView.reloadData()
                
            } else if visibleCell[indexPath.row].isExpanded {
                cellDescriptor[indexCellDescriptor + 1].isVisible = false
                cellDescriptor[indexCellDescriptor + 1].isExpanded = false
                getVisibleCells()
                tableView.reloadData()
            }
        }
    }
    
    //Get the index of a cell in the cellDecriptor array
    func getIndexDescriptor(name: String) -> Int {
        for cell in cellDescriptor where cell.primaryTitle == name {
            return cellDescriptor.indexOf(cell)!
        }
        
        return -1
    }
    
    //Get an array with all the visible cells
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

//MARK: - Table View Data Source
extension OccurenciesViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: CustomActivityCell
        let cellName = visibleCell[indexPath.row].primaryTitle
        let indexCellDescriptor = getIndexDescriptor(cellName)
        
        
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
            cell.ocurrencesLabel.text = cellDescriptor[indexCellDescriptor + 1].value
            cell.check.hidden = visibleCell[indexPath.row].buttonHidden
            
        } else {
            currentCell = visibleCell[indexPath.row - 1].primaryTitle
            cell = tableView.dequeueReusableCellWithIdentifier("idCellSlider", forIndexPath: indexPath) as! CustomActivityCell
            
//            if let value = Float(visibleCell[indexPath.row - 1].value) {
//                cell.slExperienceLevel.value = value
//                cellDescriptor[indexCellDescriptor + 1].value = "\(value)"
//            } else {
//                cell.slExperienceLevel.value = 0
//                cellDescriptor[indexCellDescriptor + 1].value = "0"
//            }
        }
        
        cell.delegate = self
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleCell.count
        
    }
}

//MARK: - Custom Cell Delegate
extension OccurenciesViewController: CustomCellDelegate {
    func sliderDidChangeValue(newSliderValue: String) {
        let indexCellDescriptor = getIndexDescriptor(currentCell)
        let index = getIndexOccurences(cellDescriptor[indexCellDescriptor].primaryTitle)
        
        cellDescriptor[indexCellDescriptor + 1].value = newSliderValue
        occurences[index] = Int(newSliderValue)!
        tableView.reloadData()
    }
    
    func getIndexOccurences(day: String) -> Int {
        switch day {
            case "Domigo":
                return 0
            
            case "Segunda-feira":
                return 1
            
            case "Terça-feira":
                return 2
            
            case "Quarta-feira":
                return 3
            
            case "Quinta-feira":
                return 4
            
            case "Sexta-feira":
                return 5
            
            default:
                return 6
            
        }
    }
}
