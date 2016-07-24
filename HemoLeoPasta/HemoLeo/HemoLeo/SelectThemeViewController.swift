//
//  SelectThemeViewController.swift
//  HemoLeo
//
//  Created by Karina F Tronkos on 7/22/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class SelectThemeViewController: UIViewController {
    
    @IBOutlet weak var fullscreenImage: UIImageView!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var applyButton: UIButton!
    
    var imageToSend = ""
    //var previousVC = UIViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.fullscreenImage.image = self.imageToSend
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        let presentingViewController: UIViewController! = self.presentingViewController
        
        self.dismissViewControllerAnimated(false) {
            presentingViewController.dismissViewControllerAnimated(false, completion: nil)
        }
        
    }
    
    @IBAction func applyButtonPressed(sender: AnyObject) {
        //previousVC.view.backgroundColor = UIColor.blueColor()
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(imageToSend, forKey: "background")
        
        let presentingViewController: UIViewController! = self.presentingViewController
        
        self.dismissViewControllerAnimated(false) {
            presentingViewController.dismissViewControllerAnimated(false, completion: nil)
                    
        }
    }
}
