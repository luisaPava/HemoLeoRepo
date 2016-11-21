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
    @IBOutlet weak var slider: G8SliderStep?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupSize = CGSize(width: 300, height: 300)
        setSliderImages()
        
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
    
    // Set the images of the slider
    func setSliderImages() {
        for i in 0...10 {
            
            switch i {
            case 0:
                slider?.stepImages?.append(#imageLiteral(resourceName: "N0"))
            case 1:
                slider?.stepImages?.append(#imageLiteral(resourceName: "N1e2"))
            case 2:
                slider?.stepImages?.append(#imageLiteral(resourceName: "N1e2"))
            case 3...4:
                slider?.stepImages?.append(#imageLiteral(resourceName: "3e4"))
            case 5:
                slider?.stepImages?.append(#imageLiteral(resourceName: "N5"))
            case 6...7:
                slider?.stepImages?.append(#imageLiteral(resourceName: "6e7"))
            case 8...9:
                slider?.stepImages?.append(#imageLiteral(resourceName: "8e9"))
            case 10:
                slider?.stepImages?.append(#imageLiteral(resourceName: "N10"))
            default:
                break
            }
        }
    }
    
    @IBAction func sliderChanged(_ sender: G8SliderStep) {
        PopUpViewController.sliderValue = Int(sender.value)
    }
    
    //Dismiss method
    @IBAction func exitButton(_ sender: AnyObject) {
        closeHandler!()
        
    }
}

