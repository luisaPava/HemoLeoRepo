//
//  Story5ViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/22/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Story5ViewController: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var storyView: Storytelling5View!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(animation), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
        //        animation()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animation () {
        
        storyView.addStory4Animation()
        
        
    }

}
