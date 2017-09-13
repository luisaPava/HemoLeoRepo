//
//  AddActivityViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/14/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit
import CareKit

class AddActivityViewController: UIViewController {
    @IBOutlet weak var vegetableBtn: UIButton!
    @IBOutlet weak var fruitsBtn: UIButton!
    @IBOutlet weak var waterBtn: UIButton!
    @IBOutlet weak var exerciseBtn: UIButton!
    @IBOutlet weak var fisiotherapyBtn: UIButton!
    @IBOutlet weak var shotBtn: UIButton!
    
    var activities: Array<Bool> = []
    var senderActivity: Int!
    var buttons: Array<UIButton> = []
    var selectedButton: UIButton!
    
    //MARK: - Managers
    fileprivate let careCardModel = CareCardModel.sharedCareCardModel
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        careCardModel.loadActivities()
        
        // Get the activities that are added to the CareKit
        activities = careCardModel.getActivities()
        
        // Set an array of buttons
        buttons += [vegetableBtn, fruitsBtn, waterBtn, exerciseBtn, fisiotherapyBtn, shotBtn]
    
        //Set the buttons state
        setButtons()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - Extension
extension AddActivityViewController {
    @IBAction func addActivityAction(sender: UIButton) {
        ButtonAnimation.addButtonPressAnimationToView(viewToAnimate: sender)
        
        let key = sender.tag
        selectedButton = sender
        
        if key == 3 || key == 4 || key == 5 {
            senderActivity = key
            performSegue(withIdentifier: "activitiesToOccurencies", sender: self)
            
        } else {
            if (activities[key] == true) {
                careCardModel.removeActivity(withKey: key)
                activities[key] = false
                sender.isSelected = false
                
            } else {
                careCardModel.addActivity(withKey: key, occurencies: nil)
                activities[key] = true
                selectedButton.isSelected = true
                
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activitiesToOccurencies" {
            if let destinationVC = segue.destination as? OccurenciesViewController {
                destinationVC.activity = senderActivity
                destinationVC.button = selectedButton
                
            }
        }
    }
    
    //MARK: - Other methods
    func setButtons() {
        //TODO - FIX THIS SHIT
        for i in 0..<6 {
            print("i - \(i)")
            print("activities - \(activities.count)")
            print("buttons \(buttons.count)")
            buttons[i].isSelected = activities[i]
        }
    }
}

