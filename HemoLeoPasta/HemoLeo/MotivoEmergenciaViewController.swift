//
//  MotivoEmergenciaViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 02/12/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class MotivoEmergenciaViewController: UIViewController {

    @IBOutlet weak var labelMotivo: UILabel!
    @IBOutlet weak var textViewMotivo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textViewMotivo.layer.cornerRadius = 20
        textViewMotivo.layer.borderWidth = 1
        textViewMotivo.layer.borderColor = UIColor(netHex: 0x2DC66D).cgColor
        
        labelMotivo.alpha = 0
        textViewMotivo.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func hadEmergency(_ sender: UIButton) {
        let flag = sender.isSelected
        
        if flag == true {
            
            labelMotivo.runAnimation(UIAnimation.fadeAlphaTo(0, duration: 0.5))
            textViewMotivo.runAnimation(UIAnimation.fadeAlphaTo(0, duration: 0.5))
            
            sender.isSelected = false
            
            

            
        } else {
            
            labelMotivo.runAnimation(UIAnimation.fadeAlphaTo(1, duration: 0.5))
            textViewMotivo.runAnimation(UIAnimation.fadeAlphaTo(1, duration: 0.5))
            
            sender.isSelected = true

            
        }
        
    }

}
