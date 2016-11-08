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
    var occurencies: [Int] = [0, 0, 0, 0, 0, 0, 0]
    var currentCell: String = ""
    
    private let codingManager: NSCodingManager = NSCodingManager.sharedNSCodingManager
    private let storeManager: CarePlanStoreManager = CarePlanStoreManager.sharedCarePlanStoreManager
    private let careCardModel = CareCardModel.sharedCareCardModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        activities = codingManager.loadToAddActivitiesData()!
       
        tableView = UITableView(frame: CGRect(x: 0, y: 100, width: 400, height: 450), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.register(UINib(nibName: "CustomActivityCell", bundle: nil), forCellReuseIdentifier: "idCellNormal")
        tableView.register(UINib(nibName: "SliderCell", bundle: nil), forCellReuseIdentifier: "idCellSlider")
        tableView.clipsToBounds = true

        
        self.view.addSubview(tableView)
//
//        getVisibleCells()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func save(sender: AnyObject) {
        
        careCardModel.addActivity(activity, occurencies)
        
//        switch activity {
//        case 3:
//            instanceOfActivity = Exercise().carePlanActivityCustom(customOccurencies: occurencies)
//            
//        case 4:
//            instanceOfActivity = Fisiotherapy().carePlanActivityCustom(customOccurencies: occurencies)
//            
//        case 5:
//            instanceOfActivity = Shot().carePlanActivityCustom(customOccurencies: occurencies)
//        default:
//            break
//        }
//        
//        if let activity = activity {
//            self.storeManager.store.add(instanceOfActivity) { (success, error) in
//                if (error != nil) {
//                    print("An error occurred when adding a new Activity: \(error.debugDescription)")
//                }
//            }
//            
//            self.activities[activity] = true
//
//            
//            // Saves the 'to add' activity to 'addedActivities' coding and array.
//            self.codingManager.saveAddedActivitiesData(activities: activities)
//            
//            // Removes the selected 'to add' activity from its coding and array.
//            self.codingManager.saveToAddActivitiesData(activities: activities)
            button.isSelected = true
//        }
        
        dismiss(animated: true, completion: nil)
        
    }
}

//MARK: - Table View Delegate
extension OccurenciesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cellName = visibleCell[indexPath.row].primaryTitle
//        let indexCellDescriptor = getIndexDescriptor(name: cellName)
        
        if occurencies[indexPath.row] == 1 {
            occurencies[indexPath.row] = 0
        } else {
            occurencies[indexPath.row] = 1
        }
        
        print(occurencies)
        
        var cell = tableView.cellForRow(at: indexPath) as! CustomActivityCell
        
        cell.check.isHidden = cell.check.isHidden ? false : true
        
//        if visibleCell[indexPath.row].isExpandable {
//            if !cellDescriptor[indexCellDescriptor + 1].isExpanded {
//                cellDescriptor[indexCellDescriptor].buttonHidden = false
//                cellDescriptor[indexCellDescriptor + 1].isVisible = true
//                cellDescriptor[indexCellDescriptor + 1].isExpanded = true
//                getVisibleCells()
//                tableView.reloadData()
//                
//            } else if visibleCell[indexPath.row].isExpanded {
//                cellDescriptor[indexCellDescriptor + 1].isVisible = false
//                cellDescriptor[indexCellDescriptor + 1].isExpanded = false
//                getVisibleCells()
//                tableView.reloadData()
//            }
//        }
    }
}

//MARK: - Table View Data Source
extension OccurenciesViewController: UITableViewDataSource {
//    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CustomActivityCell
        let cellName = self.getIndexOccurences(day: indexPath.row)

        cell = tableView.dequeueReusableCell(withIdentifier: "idCellNormal", for: indexPath as IndexPath) as! CustomActivityCell
        
        cell.labelNome.text = cellName
        print(cellName)
        
        return cell
        
    }

//    @nonobjc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
//        var cell: CustomActivityCell
//        let cellName = self.getIndexOccurences(day: indexPath.row)
//
//        cell = tableView.dequeueReusableCell(withIdentifier: "idCellNormal", for: indexPath as IndexPath) as! CustomActivityCell
//        
//        cell.labelNome.text = cellName
//        
//        print(cellName)
//        
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
        
    }
    
    //Get the correct index of the days array
    func getIndexOccurences(day: Int) -> String {
        switch day {
        case 0:
            return "Domingo"
            
        case 1:
            return "Segunda-feira"
            
        case 2:
            return "Terça-feira"
            
        case 3:
            return "Quarta-feira"
            
        case 4:
            return "Quinta-feira"
            
        case 5:
            return "Sexta-feira"
            
        default:
            return "Séabado"
            
        }
    }
}
