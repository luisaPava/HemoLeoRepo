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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.modelName.contains("iPhone") {
            
            
        } else {
            
            passo3.addPasso3Animation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo3.removePasso3Animation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo3.removePasso3Animation()
        passo3.addPasso3Animation()
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
