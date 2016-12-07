//
//  Tutorial3ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial3ViewController: UIViewController {
    @IBOutlet weak var passo3: TutorialPasso3View!
    
    @IBOutlet weak var text: UITextView!
    
    var flag: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
        passo3.clipsToBounds = true
        
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
            
            passo3.addPasso3Animation()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo3.removePasso3Animation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo3.removePasso3Animation()
        passo3.addPasso3Animation()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

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
