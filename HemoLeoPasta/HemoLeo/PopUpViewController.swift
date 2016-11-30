//
//  PopUpController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 11/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, PopupContentViewController {
    var popupSize: CGSize!
    var closeHandler: (() -> Void)?
    static var sliderValue = 0
    @IBOutlet weak var slider: G8SliderStep!
    @IBOutlet weak var labelNivel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        popupSize = CGSize(width: 300, height: 300)
        slider.maximumValue = 10.0
        slider.minimumValue = 0
        slider.stepImages = [#imageLiteral(resourceName: "N0"), #imageLiteral(resourceName: "1e2"), #imageLiteral(resourceName: "1e2"), #imageLiteral(resourceName: "3e4"), #imageLiteral(resourceName: "3e4"), #imageLiteral(resourceName: "N5"), #imageLiteral(resourceName: "6e7"), #imageLiteral(resourceName: "6e7"), #imageLiteral(resourceName: "8e9"), #imageLiteral(resourceName: "8e9"), #imageLiteral(resourceName: "N10")]
        
        
    }
    
    override func viewDidLayoutSubviews() {
        self.view.layer.cornerRadius = 10
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //Returns PopUpViewController
    class func instance() -> PopUpViewController {
        let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PopUpViewController
    }
    
    //Set PopUp size
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return popupSize
    }

    
    @IBAction func sliderChanged(_ sender: G8SliderStep) {
        PopUpViewController.sliderValue = Int(sender.value)
        labelNivel.text = String(sender.value.roundTof)
    }
    
    //Dismiss method
    @IBAction func exitButton(_ sender: AnyObject) {
        closeHandler!()
        
    }
}

