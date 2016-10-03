//
//  StoryOneViewController.swift
//  HemoLeo
//
//  Created by Luisa Mello on 7/14/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class StoryOneViewController: UIViewController {
    
    var timer = Timer()

    @IBOutlet weak var storyView: StorytellingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(animation), userInfo: nil, repeats: false)

        // Do any additional setup after loading the view.
//        animation()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animation () {
        
        storyView.addStory1Animation()

        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
