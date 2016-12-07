//
//  Tutorial2ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial2ViewController: UIViewController {
    @IBOutlet weak var passo2: TutorialPasso2View!
    @IBOutlet weak var text: UITextView!
    
    var flag: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
        passo2.clipsToBounds = true

        if flag {
            text.alpha = 0
            text.showInstructions(10)
            
            flag = false
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {

            
            passo2.addPasso2Animation()
            
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo2.removePasso2Animation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo2.removePasso2Animation()
        passo2.addPasso2Animation()
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
