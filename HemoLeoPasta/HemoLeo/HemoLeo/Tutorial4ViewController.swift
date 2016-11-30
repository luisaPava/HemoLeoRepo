//
//  Tutorial4ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial4ViewController: UIViewController {
    @IBOutlet weak var passo4: TutorialPasso4View!
    @IBOutlet weak var text: UITextView!
    
    var flag: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
        passo4.clipsToBounds = true

        // Do any additional setup after loading the view.
        if flag {
            text.alpha = 0
            text.showInstructions(10)
            
            flag = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
            
            passo4.addPasso4Animation()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo4.removePasso4Animation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo4.removePasso4Animation()
        passo4.addPasso4Animation()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
