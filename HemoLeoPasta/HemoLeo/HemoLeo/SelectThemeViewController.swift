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
    
    //var imageToSend = UIImage()
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
        if let bg = defaults.stringForKey("STRING"){ // <=============== CONSERTAR
            if (bg == "Default") {
                defaults.setObject("Default", forKey: "Background")
            }
            else if (bg == "Castelo") {
                defaults.setObject("Castelo", forKey: "Background")
            }
            else if (bg == "Cidade") {
                defaults.setObject("Cidade", forKey: "Background")
            }
            else if (bg == "Espaco") {
                defaults.setObject("Espaco", forKey: "Background")
            }
            else if (bg == "Neve") {
                defaults.setObject("Neve", forKey: "Background")
            }
            else {
                 defaults.setObject("Praia", forKey: "Background")
            }
        }
        
        let presentingViewController: UIViewController! = self.presentingViewController
        
        self.dismissViewControllerAnimated(false) {
            presentingViewController.dismissViewControllerAnimated(false, completion: nil)
                    
                }
    }
    
}
