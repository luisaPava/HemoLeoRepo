//
//  Tutorial1ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial1ViewController: UIViewController {
    @IBOutlet weak var passo2: TutorialPasso2View!

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
        
        if UIDevice.current.modelName.contains("iPhone") {
            
            
        } else {
            
            passo2.addPasso2Animation()
            passo2.clipsToBounds = true
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
