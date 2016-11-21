//
//  Tutorial6ViewController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 17/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Tutorial6ViewController: UIViewController {

    @IBOutlet weak var passo6: TutorialPasso6View!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "BG"))
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UIDevice.current.modelName.contains("iPhone") {
            
            
        } else {
            
            passo6.addPasso6Animation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        passo6.removePasso6Animation()
    }
    
    @IBAction func redo(_ sender: UIButton) {
        passo6.removePasso6Animation()
        passo6.addPasso6Animation()
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
