//
//  Tutorial1ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial1ViewController: UIViewController {

    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var passo1: TutorialPasso1View!
    var flag: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
        passo1.clipsToBounds = true

        if flag {
            text.alpha = 0
            text.showInstructions(4)
            
            flag = false
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            
            passo1.addLavarMaoAnimation()
            
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo1.removeLavarMaoAnimation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo1.removeLavarMaoAnimation()
        passo1.addLavarMaoAnimation()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
}
