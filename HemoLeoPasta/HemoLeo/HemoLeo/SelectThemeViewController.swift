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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fullscreenImage.image = UIImage(named: imageToSend)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction func applyButtonPressed(sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(imageToSend, forKey: "background")
        
        let presentingViewController: UIViewController! = self.presentingViewController
        
        self.dismiss(animated: false) {
            presentingViewController.dismiss(animated: false, completion: nil)
                    
        }
    }
}
