//
//  Tutorial7ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial7ViewController: UIViewController {

    @IBOutlet weak var passo7: TutorialPasso7View!
    @IBOutlet weak var text: UITextView!
    var flag: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
        
        if flag {
            text.alpha = 0
            text.showInstructions(2)
            
            flag = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        passo7.addPasso7Animation()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo7.removePasso7Animation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo7.removePasso7Animation()
        passo7.addPasso7Animation()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
}
