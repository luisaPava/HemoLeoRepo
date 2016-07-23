//
//  Story3ViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/22/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class Story3ViewController: UIViewController {
    
    var timer = NSTimer()
    
    
    @IBOutlet weak var storyView: Storytelling3View!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(animation), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
        //        animation()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animation () {
        
        storyView.addStory3Animation()
        
        
    }

}
